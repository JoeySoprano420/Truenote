#include "fiber.h"
Fiber fiberA, fiberB;
void taskA() {
    for (int i = 0; i < 3; ++i) {
        printf("A %d\n", i);
        swapcontext(&fiberA.ctx, &fiberB.ctx);
    }
}
void taskB() {
    for (int i = 0; i < 3; ++i) {
        printf("B %d\n", i);
        swapcontext(&fiberB.ctx, &fiberA.ctx);
    }
}
int main() {
    init_fiber(fiberA, taskA);
    init_fiber(fiberB, taskB);
    swapcontext(&main_ctx, &fiberA.ctx);
    return 0;
}
