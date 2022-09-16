#ifndef SDLW_HPP_DEFINED
#define SDLW_HPP_DEFINED

class Sdlw {
public:
    void init(std::uint32_t flags);
    void setHint(std::string name, std::string value);
    void imgInit(int flags);
    void createMainWindow(
            std::string title,
            int x,
            int y,
            int w,
            int h,
            std::uint32_t flags);
    void createMainRenderer(int index, std::uint32_t flags);
    void setRenderDrawColor(
            std::uint8_t r,
            std::uint8_t g,
            std::uint8_t b,
            std::uint8_t a);
    void destroy(void);
    void renderClear(void);
    void renderPresent(void);
    int renderCopy(
            SDL_Texture* texture,
            const SDL_Rect* srcrect,
            const SDL_Rect* dstrect);
    SDL_Texture* imgLoadTexture(std::string file);

private:
    SDL_Window* mainWindow;
    SDL_Renderer* mainRenderer;
};

#endif // SDLW_HPP_DEFINED