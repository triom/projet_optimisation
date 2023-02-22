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

  f32 x, y, z;
  f32 vx, vy, vz;

} particle_t;

//
void init(particle_t *p, u64 n)
{
  for (u64 i = 0; i < n; i++)
  {
    //
    u64 r1 = (u64)rand();
    u64 r2 = (u64)rand();
    f32 sign = (r1 > r2) ? 1 : -1;

    //
    p[i].x = sign * (f32)rand() / (f32)RAND_MAX;
    p[i].y = (f32)rand() / (f32)RAND_MAX;
    p[i].z = sign * (f32)rand() / (f32)RAND_MAX;

    //
    p[i].vx = (f32)rand() / (f32)RAND_MAX;
    p[i].vy = sign * (f32)rand() / (f32)RAND_MAX;
    p[i].vz = (f32)rand() / (f32)RAND_MAX;
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
#endif

//
void move_particles(particle_t *p, const f32 dt, u64 n)
{
  //
  const f32 softening = 1e-20;

//
#pragma omp parallel private(i, j) shared(softening, fx, fy, fz) scheduled(guided)
  {
#pragma omp unroll full reduction(+ \
                                  : fx, fy, fz)
    for (u64 i = 0; i < n; i++)
    {
      //
      f32 fx = 0.0;
      f32 fy = 0.0;
      f32 fz = 0.0;

      // 23 floating-point operations
      for (u64 j = 0; j < n; j++)
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
#pragma omp unroll full reduction(+ \
                                  : p[i].x, p[i].y, p[i].z)
    for (u64 i = 0; i < n; i++)
    {
      p[i].x += dt * p[i].vx;
      p[i].y += dt * p[i].vy;
      p[i].z += dt * p[i].vz;
    }
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
  particle_t *p = malloc(sizeof(particle_t) * n);

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
  free(p);

  //
  return 0;
}

// maqao.intel64 oneview -R1  -WS c=config.lua xp=Parallel