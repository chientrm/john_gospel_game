// sdl_utils.c - SDL2 utility library for Dart FFI
#include <SDL2/SDL.h>
#include <stdbool.h>

static SDL_Window *window = NULL;
static SDL_Renderer *renderer = NULL;

// Create a window and renderer
bool create_window(int width, int height, const char *title)
{
    if (SDL_Init(SDL_INIT_VIDEO) != 0)
        return false;
    window = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, width, height, 0);
    if (!window)
        return false;
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer)
        return false;
    return true;
}

// Draw a filled rectangle
void draw_rect(int x, int y, int w, int h, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
{
    if (!renderer)
        return;
    SDL_SetRenderDrawColor(renderer, r, g, b, a);
    SDL_Rect rect = {x, y, w, h};
    SDL_RenderFillRect(renderer, &rect);
    SDL_RenderPresent(renderer);
}

// Poll events and check if window should close
bool poll_window()
{
    SDL_Event event;
    while (SDL_PollEvent(&event))
    {
        if (event.type == SDL_QUIT)
            return false;
    }
    return true;
}

// Destroy window and cleanup
void destroy_window()
{
    if (renderer)
        SDL_DestroyRenderer(renderer);
    if (window)
        SDL_DestroyWindow(window);
    SDL_Quit();
}
