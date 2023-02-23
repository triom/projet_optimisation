//
#include <omp.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

//
typedef float f32;
typedef double f64;
typedef unsigned long long u64;

//
typedef struct particle_s
{

  f32 *arr_x, *arr_y, *arr_z, *arr_vx, *arr_vy, *arr_vz;

} particle_t;

//
void init(particle_t p, u64 n)
{
  for (u64 i = 0; i < n; i++)
  {
    //
    u64 r1 = (u64)rand();
    u64 r2 = (u64)rand();
    f32 sign = (r1 > r2) ? 1 : -1;

    //
    p.arr_x[i] = sign * (f32)rand() / (f32)RAND_MAX;
    p.arr_y[i] = (f32)rand() / (f32)RAND_MAX;
    p.arr_z[i] = sign * (f32)rand() / (f32)RAND_MAX;

    //
    p.arr_vx[i] = (f32)rand() / (f32)RAND_MAX;
    p.arr_vy[i] = sign * (f32)rand() / (f32)RAND_MAX;
    p.arr_vz[i] = (f32)rand() / (f32)RAND_MAX;
  }
}

/*
#ifdef OPT1
#elif defined OPT2
#else
#endif
*/

//
#ifdef OPT1
void move_particles(particle_t *p, const f32 dt, u64 n)
{
  //
  const f32 softening = 1e-20;

  //
  for (u64 i = 0; i < n; i++)
  {
    //
    f32 fx = 0.0;
    f32 fy = 0.0;
    f32 fz = 0.0;

    // 23 floating-point operations
    for (u64 j = 0; j < n; j += 4)
    {
      // Newton's law
      const f32 dx1 = p[j].x - p[i].x;
      const f32 dy1 = p[j].y - p[i].y;
      const f32 dz1 = p[j].z - p[i].z;
      const f32 d_2_1 = (dx1 * dx1) + (dy1 * dy1) + (dz1 * dz1) + softening;
      const f32 d_3_over_2_1 = powf(d_2_1, 1.5);

      fx += dx1 / d_3_over_2_1;
      fy += dy1 / d_3_over_2_1;
      fz += dz1 / d_3_over_2_1;

      const f32 dx2 = p[j + 1].x - p[i].x;
      const f32 dy2 = p[j + 1].y - p[i].y;
      const f32 dz2 = p[j + 1].z - p[i].z;
      const f32 d_2_2 = (dx2 * dx2) + (dy2 * dy2) + (dz2 * dz2) + softening;
      const f32 d_3_over_2_2 = powf(d_2_2, 1.5);

      fx += dx2 / d_3_over_2_2;
      fy += dy2 / d_3_over_2_2;
      fz += dz2 / d_3_over_2_2;

      const f32 dx3 = p[j + 2].x - p[i].x;
      const f32 dy3 = p[j + 2].y - p[i].y;
      const f32 dz3 = p[j + 2].z - p[i].z;
      const f32 d_2_3 = (dx3 * dx3) + (dy3 * dy3) + (dz3 * dz3) + softening;
      const f32 d_3_over_2_3 = powf(d_2_3, 1.5);

      fx += dx3 / d_3_over_2_3;
      fy += dy3 / d_3_over_2_3;
      fz += dz3 / d_3_over_2_3;

      const f32 dx4 = p[j + 3].x - p[i].x;
      const f32 dy4 = p[j + 3].y - p[i].y;
      const f32 dz4 = p[j + 3].z - p[i].z;
      const f32 d_2_4 = (dx4 * dx4) + (dy4 * dy4) + (dz4 * dz4) + softening;
      const f32 d_3_over_2_4 = powf(d_2_4, 1.5);

      fx += dx4 / d_3_over_2_4;
      fy += dy4 / d_3_over_2_4;
      fz += dz4 / d_3_over_2_4;
    }

    //
    p[i].vx += dt * fx; // 19
    p[i].vy += dt * fy; // 21
    p[i].vz += dt * fz; // 23
  }

  // 6 floating-point operations
  for (u64 i = 0; i < n; i += 4)
  {
    p[i].x += dt * p[i].vx;
    p[i].y += dt * p[i].vy;
    p[i].z += dt * p[i].vz;

    p[i + 1].x += dt * p[i + 1].vx;
    p[i + 1].y += dt * p[i + 1].vy;
    p[i + 1].z += dt * p[i + 1].vz;

    p[i + 2].x += dt * p[i + 2].vx;
    p[i + 2].y += dt * p[i + 2].vy;
    p[i + 2].z += dt * p[i + 2].vz;

    p[i + 3].y += dt * p[i + 3].vy;
    p[i + 3].x += dt * p[i + 3].vx;
    p[i + 3].z += dt * p[i + 3].vz;
  }
}

#elif defined OPT2
//
void move_particles(particle_t *p, const f32 dt, u64 n)
{
  u64 i, j;
  f32 fx, fy, fz;
  //
  const f32 softening = 1e-20;

  //
#pragma omp parallel private(i, j) shared(softening, fx, fy, fz)
  {
#pragma omp for schedule(guided)
    for (i = 0; i < n; i++)
    {
      //
      f32 fx = 0.0;
      f32 fy = 0.0;
      f32 fz = 0.0;

      // 23 floating-point operations
#pragma omp simd reduction(+ \
                           : fx, fy, fz)
      for (j = 0; j < n; j++)
      {
        // Newton's law
        const f32 dx = p[j].x - p[i].x;                                // 1 (sub)
        const f32 dy = p[j].y - p[i].y;                                // 2 (sub)
        const f32 dz = p[j].z - p[i].z;                                // 3 (sub)
        const f32 d_2 = (dx * dx) + (dy * dy) + (dz * dz) + softening; // 9 (mul, add)
        const f32 d_3_over_2 = pow(d_2, 3.0 / 2.0);                    // 11 (pow, div)

        // Net force
        fx += dx / d_3_over_2; // 13 (add, div)
        fy += dy / d_3_over_2; // 15 (add, div)
        fz += dz / d_3_over_2; // 17 (add, div)
      }

      //
      p[i].vx += dt * fx; // 19 (mul, add)
      p[i].vy += dt * fy; // 21 (mul, add)
      p[i].vz += dt * fz; // 23 (mul, add)
    }

    // 3 floating-point operations

#pragma omp for schedule(guided)
    for (u64 i = 0; i < n; i++)
    {
      p[i].x += dt * p[i].vx;
      p[i].y += dt * p[i].vy;
      p[i].z += dt * p[i].vz;
    }
  }
}
#endif

void move_particles(particle_t p, const f32 dt, u64 n)
{
  f32 fx, fy, fz;
  const f32 softening = 1e-20;
  u64 i, j;

  //
  for (i = 0; i < n; i++)
  {
    //
    f32 fx = 0.0;
    f32 fy = 0.0;
    f32 fz = 0.0;

    // 23 floating-point operations
#pragma omp parallel for simd shared(p, softening) reduction(+ \
                                                             : fx, fy, fz)
    for (j = 0; j < n; j += 4)
    {
      // Newton's law
      const f32 dx1 = p.arr_x[j] - p.arr_x[i];
      const f32 dy1 = p.arr_y[j] - p.arr_y[i];
      const f32 dz1 = p.arr_z[j] - p.arr_z[i];
      const f32 d_2_1 = (dx1 * dx1) + (dy1 * dy1) + (dz1 * dz1) + softening;
      const f32 d_3_over_2_1 = 1.0f / (d_2_1 * sqrtf(d_2_1));

      fx += dx1 * (1 / d_3_over_2_1);
      fy += dy1 * (1 / d_3_over_2_1);
      fz += dz1 * (1 / d_3_over_2_1);

      const f32 dx2 = p.arr_x[j + 1] - p.arr_x[i];
      const f32 dy2 = p.arr_y[j + 1] - p.arr_y[i];
      const f32 dz2 = p.arr_z[j + 1] - p.arr_z[i];
      const f32 d_2_2 = (dx2 * dx2) + (dy2 * dy2) + (dz2 * dz2) + softening;
      const f32 d_3_over_2_2 = 1.0f / (d_2_2 * sqrtf(d_2_2));

      fx += dx2 * (1 / d_3_over_2_2);
      fy += dy2 * (1 / d_3_over_2_2);
      fz += dz2 * (1 / d_3_over_2_2);

      const f32 dx3 = p.arr_x[j + 2] - p.arr_x[i];
      const f32 dy3 = p.arr_y[j + 2] - p.arr_y[i];
      const f32 dz3 = p.arr_z[j + 2] - p.arr_z[i];
      const f32 d_2_3 = (dx3 * dx3) + (dy3 * dy3) + (dz3 * dz3) + softening;
      const f32 d_3_over_2_3 = 1.0f / (d_2_3 * sqrtf(d_2_3));

      fx += dx3 * (1 / d_3_over_2_3);
      fy += dy3 * (1 / d_3_over_2_3);
      fz += dz3 * (1 / d_3_over_2_3);

      const f32 dx4 = p.arr_x[j + 3] - p.arr_x[i];
      const f32 dy4 = p.arr_y[j + 3] - p.arr_y[i];
      const f32 dz4 = p.arr_z[j + 3] - p.arr_z[i];
      const f32 d_2_4 = (dx4 * dx4) + (dy4 * dy4) + (dz4 * dz4) + softening;
      const f32 d_3_over_2_4 = 1.0f / (d_2_4 * sqrtf(d_2_4));

      fx += dx4 * (1 / d_3_over_2_4);
      fy += dy4 * (1 / d_3_over_2_4);
      fz += dz4 * (1 / d_3_over_2_4);
    }
    //
    //
    p.arr_vx[i] += dt * fx; // 19
    p.arr_vy[i] += dt * fy; // 21
    p.arr_vz[i] += dt * fz; // 23
  }
  // 6 floating-point operations

#pragma omp for schedule(guided)
  for (u64 i = 0; i < n; i += 4)
  {
    p.arr_x[i] += dt * p.arr_vx[i];
    p.arr_y[i] += dt * p.arr_vy[i];
    p.arr_z[i] += dt * p.arr_vz[i];

    p.arr_x[i + 1] += dt * p.arr_vx[i + 1];
    p.arr_y[i + 1] += dt * p.arr_vy[i + 1];
    p.arr_z[i + 1] += dt * p.arr_vz[i + 1];

    p.arr_x[i + 2] += dt * p.arr_vx[i + 2];
    p.arr_y[i + 2] += dt * p.arr_vy[i + 2];
    p.arr_z[i + 2] += dt * p.arr_vz[i + 2];

    p.arr_x[i + 3] += dt * p.arr_vx[i + 3];
    p.arr_y[i + 3] += dt * p.arr_vy[i + 3];
    p.arr_z[i + 3] += dt * p.arr_vz[i + 3];
  }
}

//
int main(int argc, char **argv)
{
  //
  const u64 n = (argc > 1) ? atoll(argv[1]) : 16384;
  const u64 steps = 10;
  const f32 dt = 0.01;

  //
  f64 rate = 0.0, drate = 0.0;

  // Steps to skip for warm up
  const u64 warmup = 3;

  //
  particle_t p;
  p.arr_x = malloc(sizeof(f32) * n);
  p.arr_y = malloc(sizeof(f32) * n);
  p.arr_z = malloc(sizeof(f32) * n);
  p.arr_vx = malloc(sizeof(f32) * n);
  p.arr_vy = malloc(sizeof(f32) * n);
  p.arr_vz = malloc(sizeof(f32) * n);

  //
  init(p, n);

  const u64 s = sizeof(particle_t) * n;

  printf("\n\033[1mTotal memory size:\033[0m %llu B, %llu KiB, %llu MiB\n\n", s, s >> 10, s >> 20);

  //
  printf("\033[1m%5s %10s %10s %8s\033[0m\n", "Step", "Time, s", "Interact/s", "GFLOP/s");
  fflush(stdout);

  //
  for (u64 i = 0; i < steps; i++)
  {
    // Measure
    const f64 start = omp_get_wtime();

    move_particles(p, dt, n);

    const f64 end = omp_get_wtime();

    // Number of interactions/iterations
    const f32 h1 = (f32)(n) * (f32)(n - 1);

    // GFLOPS
    const f32 h2 = (23.0 * h1 + 6.0 * (f32)n) * 1e-9;

    if (i >= warmup)
    {
      rate += h2 / (end - start);
      drate += (h2 * h2) / ((end - start) * (end - start));
    }

    //
    printf("%5llu %10.3e %10.3e %8.1f %s\n",
           i,
           (end - start),
           h1 / (end - start),
           h2 / (end - start),
           (i < warmup) ? "*" : "");

    fflush(stdout);
  }

  //
  rate /= (f64)(steps - warmup);
  drate = sqrt(drate / (f64)(steps - warmup) - (rate * rate));

  printf("-----------------------------------------------------\n");
  printf("\033[1m%s %4s \033[42m%10.1lf +- %.1lf GFLOP/s\033[0m\n",
         "Average performance:", "", rate, drate);
  printf("-----------------------------------------------------\n");

  //
  free(p.arr_x);
  free(p.arr_y);
  free(p.arr_z);
  free(p.arr_vx);
  free(p.arr_vy);
  free(p.arr_vz);

  //
  return 0;
}

