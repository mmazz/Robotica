#ifndef __ROS_KEYBOARD_H__
#define __ROS_KEYBOARD_H__

#include <keyboard/Key.h>// Se esta auto llamando? o es una libreria de  C++?
#include <SDL.h>

namespace keyboard {
  class Keyboard {
    public:
      Keyboard(void);
      ~Keyboard(void); // Cual seria la diferencia entre cada 1?

      bool get_key(bool& new_event, bool& pressed, uint16_t& code, uint16_t& modifiers);

    private:
      SDL_Surface* window; // Que hace esto?
  };    
}

#endif
