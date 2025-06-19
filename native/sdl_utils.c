// sdl_utils.c - SDL2 utility library for Dart FFI
#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#include <stdbool.h>
#include <string.h>

static SDL_Window *window = NULL;
static SDL_Renderer *renderer = NULL;
static TTF_Font *font = NULL;
static SDL_Keycode last_key_pressed = 0;

// Initialize SDL2, SDL_ttf, create window and renderer, and load font
bool create_window(int width, int height, const char *title)
{
    if (SDL_Init(SDL_INIT_VIDEO) != 0)
        return false;
    if (TTF_Init() != 0)
        return false;
    window = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, width, height, 0);
    if (!window)
        return false;
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer)
        return false;
    font = TTF_OpenFont("assets/DejaVuSans.ttf", 24); // Font file must be in assets/
    if (!font)
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
}

// Render text at (x, y) with RGBA color
void draw_text(const char *text, int x, int y, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
{
    if (!renderer || !font || !text)
        return;
    SDL_Color color = {r, g, b, a};
    SDL_Surface *surface = TTF_RenderUTF8_Blended(font, text, color);
    if (!surface)
        return;
    SDL_Texture *texture = SDL_CreateTextureFromSurface(renderer, surface);
    if (!texture)
    {
        SDL_FreeSurface(surface);
        return;
    }
    SDL_Rect dst = {x, y, surface->w, surface->h};
    SDL_RenderCopy(renderer, texture, NULL, &dst);
    SDL_FreeSurface(surface);
    SDL_DestroyTexture(texture);
}

// Measure the pixel width of a UTF-8 string using the current font
int measure_text_width(const char *text)
{
    if (!font || !text)
        return 0;
    int w = 0, h = 0;
    TTF_SizeUTF8(font, text, &w, &h);
    return w;
}

// Poll events, check if window should close, and capture key presses
bool poll_window()
{
    SDL_Event event;
    while (SDL_PollEvent(&event))
    {
        if (event.type == SDL_QUIT)
            return false;
        if (event.type == SDL_KEYDOWN)
            last_key_pressed = event.key.keysym.sym;
    }
    return true;
}

// Get the last key pressed (returns 0 if none)
int get_last_key_pressed()
{
    return last_key_pressed;
}

// Clear the last key pressed
void clear_last_key_pressed()
{
    last_key_pressed = 0;
}

// Clear the screen with a color using SDL_RenderClear
void clear_screen(Uint8 r, Uint8 g, Uint8 b, Uint8 a)
{
    if (!renderer)
        return;
    SDL_SetRenderDrawColor(renderer, r, g, b, a);
    SDL_RenderClear(renderer);
}

// Present the renderer
void present_renderer()
{
    if (renderer)
        SDL_RenderPresent(renderer);
}

// Destroy window and cleanup
void destroy_window()
{
    if (font)
        TTF_CloseFont(font);
    if (renderer)
        SDL_DestroyRenderer(renderer);
    if (window)
        SDL_DestroyWindow(window);
    TTF_Quit();
    SDL_Quit();
}

// Draw a line from (x1, y1) to (x2, y2) with RGBA color
void draw_line(int x1, int y1, int x2, int y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
{
    if (!renderer)
        return;
    SDL_SetRenderDrawColor(renderer, r, g, b, a);
    SDL_RenderDrawLine(renderer, x1, y1, x2, y2);
}
