# Connect Four CLI Game

A command-line Connect Four game built to practice Test-Driven Development (TDD) as part of [The Odin Project](https://www.theodinproject.com) curriculum.

## Getting Started

To play the game, clone this repository and run the following command in your terminal:

```bash
ruby connect_four.rb
```

## Things to Improve

- **Tests**: The current tests for the `Game` class are minimal. They need to cover more edge cases for better reliability.
- **Code Structure**: 
  - Refactor the `get_player_move` method to separate the logic of "getting the move" from "making the move".
  - Consider renaming this method for better clarity.
  - Decouple methods within the `Game` class for improved modularity.

## Future Features

- **Custom Players**: Add the ability to select different player classes, each with their own methods (e.g., `get_move`), to make the code more flexible and modular.
