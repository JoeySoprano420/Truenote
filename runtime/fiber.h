#pragma once
#include <ucontext.h>
struct Fiber {
    ucontext_t ctx;
    char stack[8192];
    bool done = false;
};

void init_fiber(Fiber &fiber, void (*func)()) {
    getcontext(&fiber.ctx);
    fiber.ctx.uc_stack.ss_sp = fiber.stack;
    fiber.ctx.uc_stack.ss_size = sizeof(fiber.stack);
    fiber.ctx.uc_link = nullptr;
    makecontext(&fiber.ctx, func, 0);
}
