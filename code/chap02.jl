### A Pluto.jl notebook ###
# v1.1.0

using Markdown
using InteractiveUtils

# ╔═╡ 95bd3347-7c49-4c74-a759-2b4970721901
using StatsBase

# ╔═╡ fd8cc9d2-e1e6-498c-bddf-7659264a8271
using InvertedIndices

# ╔═╡ 7d01b4e0-d334-11f1-b6ab-99de9f9c4910
md"""
# 模拟频率主义者的解释
"""

# ╔═╡ ce07609d-fdb4-40a8-b407-1728819719e7
md"""
回想一下，基于大量$n$次重复实验的条件概率的频率论解释是：$P(A|B) ≈ n_{AB} / n_{B}$，$n_{AB}$是$A ∩ B$发生的次数，$n_{B}$是$B$发生的次数。让我们通过模拟来尝试一下，并验Example 2.2.5的结果。我们来模拟$n$个家庭，每个家庭有两个孩子。
"""

# ╔═╡ dca6e78d-4f4b-45a7-b6c1-770588900ed9
begin
	n = 10^5
	child1 = sample(1:2, n)
	child2 = sample(1:2, n)
end

# ╔═╡ e9c5b93e-6ab3-4435-a1c7-c75ba473bb90
md"""
这里`child1`是一个长度为$n$的向量，其中每个元素都是$1$或$2$。让$1$代表“女孩”，$2$代表“男孩”，这个向量代表了$n$个家庭中年龄较大的孩子的性别。同样，`child2`代表每个家庭中年龄较小的孩子的性别。
"""

# ╔═╡ 03b544f5-516a-48a6-ac92-a4cca90421dc
md"""
或者，我们可以用
"""

# ╔═╡ fa6a48a3-7ad6-49bb-83cc-03e7a2f87fea
sample([:girl, :boy], n)

# ╔═╡ 854ace10-f04a-4961-b50e-b8ace39c77b1
md"""
但是处理数值更方便。
"""

# ╔═╡ 9c3d37e5-f500-4239-87e0-da475155a36e
md"""
设$A$是两个孩子都是女孩的事件，$B$是大孩子是女孩的事件。
"""

# ╔═╡ dbd88271-4b2d-4a82-bff7-710ac578e991
md"""
条件概率告诉我们如何随着新证据的出现来更新概率。
书中图示展示了事件$A$在初始状态、获得第一项证据$B$之后，以及获得第二项证据$C$之后的概率。
观察到第一项证据后得到的$A$的后验概率，将成为观察第二项证据前的新先验概率。在同时观察到$B$
和$C$之后，可以通过多种方式求得$A$的新后验概率。如果还有更多证据，这个新的后验概率将作为新
的先验概率被收集。
"""

# ╔═╡ c5fb61bd-1467-4506-8d50-1f0ea14ee13a
md"""
按照频率论者的解释，我们计算$B$出现的重复次数出现并命名为`n_b`，我们也计算$A ∩ B$出现的重复次数并命名为`n_ab`。最后，我们用`n_ab`除以`n_b`来近似$P(A|B)$。
"""

# ╔═╡ 1b0b17de-54be-4416-84ba-245d63c85c1b
let
	n_b = sum(child1 .== 1)
	n_ab = sum((child1 .== 1) .& (child2 .== 1))
	n_ab / n_b
end

# ╔═╡ 6af168a5-0ded-42d9-aba9-78a8be50ad99
md"""
符号`.&`表示逐元素的与运算，因此`n_ab`是指第一胎和第二胎都是女孩的家庭数量。当我们运行这段代码时，得到的结果是 0.50，这与$P(\text{both girls}|\text{elder is a girl})=1/2$一致。
"""

# ╔═╡ a507600e-5627-485a-9c6a-006450c0ad9f
md"""
现在设$A$是两个孩子都是女孩的事件，$B$是至少一个孩子是女孩的事件。那么$A ∩ B$是相同的，但是`n_b`需要计算至少有一个孩子是女孩的家庭的数量。这是通过按位或操作符`.|`完成的。
"""

# ╔═╡ 2a844011-bd79-47d6-9a8b-5e4c585c278e
let
	n_b = sum((child1 .== 1) .| (child2 .== 1))
	n_ab = sum((child1 .== 1) .& (child2 .== 1))
	n_ab / n_b
end

# ╔═╡ 9bbfeba6-5042-44f5-807e-6d91402b785c
md"""
我们得到$0.33$，符合$P(\text{both girls}|\text{at least one girl}) = 1/3$。
"""

# ╔═╡ 7a975a48-76e8-4fd7-9921-6ecbda89b7cc
md"""
# Monty Hall模拟
"""

# ╔═╡ 51343d65-291f-489c-b7bf-d6cfec320412
md"""
许多关于Monty Hall问题的漫长而激烈的争论本可以通过模拟实验来避免。为了研究永不切换策略的效果，让我们生成$105$次Monty Hall博弈。为了简化符号，假设对手总是选择1号门。然后我们可以生成一个向量，指定每次重复哪个门有汽车：
"""

# ╔═╡ 077f4107-5ee5-4639-8d3b-a99c7a1f4abf
let
	n = 10^5
	cardoor = sample(1:3, n)
end

# ╔═╡ c1af86d7-bd67-4e7d-96f1-5e8e9296d3e9
md"""
此时，我们可以生成指定Monty打开哪扇门的向量，但这是不必要的，因为永不切换策略成功当且仅当门
1有车！所以用不切换策略成功的次数是`sum(cardoor .== 1) / n`，在我们的模拟中是$0.334$。这非常接近真实值，$1/3$。
"""

# ╔═╡ ea7503d4-b4ed-4356-a285-784defcb7cb6
md"""
如果我们想以交互方式玩Monty Hall游戏呢？我们可以通过编写一个函数来实现。在Julia中输入以下代码，即可定义一个名为`monty`的函数，之后每当你想玩游戏时，只需输入命令`monty()`即可调用该函数！
"""

# ╔═╡ cdad443b-3ce8-49c9-a751-9e93cda35474
function monty()
	doors = 1:3

	# randomly pick where the car is
	cardoor = sample(doors, 1)[1]

	# prompt player
	print("Monty Hall says 'Pick a door, any door!' ")

	# receive the player's choice of door (should be 1,2, or 3)
	chosen = parse(Int, strip(readline()))

	# pick Monty's door (can't be the player's door or the car door)
	if (chosen != cardoor) 
		montydoor = doors[Not([chosen, cardoor])][1]
	else 
		montydoor = sample(doors[Not(chosen)], 1)[1]
	end

	# find out whether the player wants to switch doors	
	println("Monty opens door $(montydoor)!")
	print("Would you like to switch (y/n)? ")
	reply = strip(readline())

	# interpret what player wrote as "yes" if it starts with "y"
	if reply[1] == 'y'
		chosen = doors[Not([chosen, montydoor])][1]
	end

	# announce the result of the game!
	if chosen == cardoor
		println("You won!")
	else
		println("You lost!")
	end
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
InvertedIndices = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
InvertedIndices = "~1.3.1"
StatsBase = "~0.34.13"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.13.3"
manifest_format = "2.1"
project_hash = "b1a6457c0babda00433b70f8c50913bb9cecd7b9"

[[deps.AliasTables]]
deps = ["PtrArrays", "Random"]
git-tree-sha1 = "9876e1e164b144ca45e9e3198d0b689cadfed9ff"
registries = "General"
uuid = "66dad0bd-aa9a-41b7-9441-69ab47430ed8"
version = "1.1.3"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.5.5+2"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
registries = "General"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataStructures]]
deps = ["OrderedCollections"]
git-tree-sha1 = "b0bc6d2cad1fed8b7fd59a1551a991cb3d2809e6"
registries = "General"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.19.6"

[[deps.DocStringExtensions]]
git-tree-sha1 = "7442a5dfe1ebb773c29cc2962a8980f47221d76c"
registries = "General"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.5"

[[deps.InvertedIndices]]
git-tree-sha1 = "6da3c4316095de0f5ee2ebd875df8721e7e0bdbe"
registries = "General"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.3.1"

[[deps.IrrationalConstants]]
git-tree-sha1 = "d22e8bdb3f03c300a103ff23c0dd5a654c6701de"
registries = "General"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.7"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.13.0"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "28d620bcdb37a3fb02de9f521928ee453690f414"
registries = "General"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "1.0.3"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "d9d20d6eb2a3290ba5c70a1c013b45305cc39c9e"
registries = "General"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.30+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "94ba93778373a53bfd5a0caaf7d809c445292ff4"
registries = "General"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.2"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.PtrArrays]]
git-tree-sha1 = "4fbbafbc6251b883f4d2705356f3641f3652a7fe"
registries = "General"
uuid = "43287f4e-b6f4-7ad1-bb20-aadabca52c3d"
version = "1.4.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "1.0.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "13cd91cc9be159e3f4d95b857fa2aa383b53772a"
registries = "General"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.3"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.13.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "e2b53ce13a53367e96601081e33d34746b571bad"
registries = "General"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.5"
weakdeps = ["SparseArrays"]

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "178ed29fd5b2a2cfc3bd31c13375ae925623ff36"
registries = "General"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.8.0"

[[deps.StatsBase]]
deps = ["AliasTables", "DataAPI", "DataStructures", "IrrationalConstants", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "adb9da019510162e67a4493fc235c23203d8b09e"
registries = "General"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.34.13"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.10.1+0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"

[registries.General]
url = "https://github.com/JuliaRegistries/General.git"
uuid = "23338594-aafe-5451-b93e-139f81909106"
"""

# ╔═╡ Cell order:
# ╟─7d01b4e0-d334-11f1-b6ab-99de9f9c4910
# ╟─ce07609d-fdb4-40a8-b407-1728819719e7
# ╠═95bd3347-7c49-4c74-a759-2b4970721901
# ╠═dca6e78d-4f4b-45a7-b6c1-770588900ed9
# ╟─e9c5b93e-6ab3-4435-a1c7-c75ba473bb90
# ╟─03b544f5-516a-48a6-ac92-a4cca90421dc
# ╠═fa6a48a3-7ad6-49bb-83cc-03e7a2f87fea
# ╟─854ace10-f04a-4961-b50e-b8ace39c77b1
# ╟─9c3d37e5-f500-4239-87e0-da475155a36e
# ╟─dbd88271-4b2d-4a82-bff7-710ac578e991
# ╟─c5fb61bd-1467-4506-8d50-1f0ea14ee13a
# ╠═1b0b17de-54be-4416-84ba-245d63c85c1b
# ╟─6af168a5-0ded-42d9-aba9-78a8be50ad99
# ╟─a507600e-5627-485a-9c6a-006450c0ad9f
# ╠═2a844011-bd79-47d6-9a8b-5e4c585c278e
# ╟─9bbfeba6-5042-44f5-807e-6d91402b785c
# ╟─7a975a48-76e8-4fd7-9921-6ecbda89b7cc
# ╟─51343d65-291f-489c-b7bf-d6cfec320412
# ╟─077f4107-5ee5-4639-8d3b-a99c7a1f4abf
# ╟─c1af86d7-bd67-4e7d-96f1-5e8e9296d3e9
# ╟─ea7503d4-b4ed-4356-a285-784defcb7cb6
# ╠═fd8cc9d2-e1e6-498c-bddf-7659264a8271
# ╠═cdad443b-3ce8-49c9-a751-9e93cda35474
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
