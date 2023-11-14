for /R %%f in (*.cpp) do clang-format -i -style=file "%%f"
for /R %%f in (*.h) do clang-format -i -style=file "%%f"
for /R %%f in (*.hpp) do clang-format -i -style=file "%%f"