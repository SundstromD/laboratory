#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "laboratory" ? 0 : 1;
}
