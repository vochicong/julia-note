### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ 49b44084-09de-11ec-0927-07f0aa40655a
using LinearAlgebra

# ╔═╡ 55d1442c-19f8-4062-9349-4f1e8a3b75b5
A = [
    1 1 1 1 1 1 1
    0.4-1 0.2 zeros(5)'
    0.6 -1 0.4 zeros(4)'
    0 0.8 0.6-1 0.4 zeros(3)'
    zeros(3)' -1 0 0.2 0
    zeros(3)' 0.3 -1 0 1
    zeros(3)' 0.3 1 -1 0
    zeros(5)' 0.8 -1
]

# ╔═╡ 28856243-d420-48b6-bbef-a715edacd280
b = [1 0 0 0 0 0 0 0]'

# ╔═╡ 41c1d606-d8c6-4384-b4d5-e897e4b483d4
A \ b

# ╔═╡ b8ef1059-798d-49bf-bdb4-4a9ce6021b7c
html"""<style>
main {
    max-width: 800px;
    align-self: flex-start;
    margin-left: 10px;
}
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ Cell order:
# ╠═49b44084-09de-11ec-0927-07f0aa40655a
# ╟─55d1442c-19f8-4062-9349-4f1e8a3b75b5
# ╟─28856243-d420-48b6-bbef-a715edacd280
# ╠═41c1d606-d8c6-4384-b4d5-e897e4b483d4
# ╟─b8ef1059-798d-49bf-bdb4-4a9ce6021b7c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
