powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

uv python install --wait

uv init manimations
cd manimations
uv add manim

uv run manim checkhealth

import manim