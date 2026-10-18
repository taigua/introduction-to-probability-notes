### A Pluto.jl notebook ###
# v1.0.4

using Markdown
using InteractiveUtils

# ╔═╡ 71517291-ed97-4dff-8dfd-3ca260ca3c54
using InvertedIndices

# ╔═╡ 759b1cc7-00c7-4722-8c60-c6e67712d1cf
using StatsBase

# ╔═╡ 4623521d-487a-46f8-b3d8-184c17d176f8
md"""
# 向量
"""

# ╔═╡ 0008eb20-ca8d-11f1-a675-dd03da3fae8f
md"""
Julia从[APL](https://en.wikipedia.org/wiki/APL_(programming_language))中汲取了很多灵感，或者说APL深刻地影响了数值计算相关语言和软件（比如R，Numpy以及Julia）。尽管Julia没有像R那样采用一切皆是向量的做法，且官方最初宣传的是使用循环就好，不需要费脑筋想着如何*向量化*（实际上最初循环代码比向量化要快，现在两者基本相差无几）。但Julia对向量化的支持依然非常优秀，深得APL精髓。并且*向量化*是一种思考方式，能提供一个看待问题的新角度，向量化代码往往要比循环代码更简洁和清晰。Julia中创建向量就和其他语言创建数组或者列表一样，使用`[]`。例如：
"""

# ╔═╡ 547b55fa-84ed-4b9b-a775-8ae5b356659d
v = [3, 1, 4, 1, 5, 9]

# ╔═╡ 95a6552d-efa1-4c4e-8e03-1a44c98585c4
md"""
定义了**v**为向量(3, 1, 4, 1, 5, 9)。类似地，`n = 110`将`n`赋值为110；Julia是区分向量和标量的，这里的`n`是标量。
"""

# ╔═╡ b76ba786-e54f-4f04-bc96-483a649a0d4d
sum(v)

# ╔═╡ d23c2f8e-c30e-4e4f-a9d3-91557fde5729
md"""
`sum(v)`将**v**的元素加起来，`maximum(v)`给出其最大值，`minimum(v)`给出其最小值，`length(v)`给出其长度。
"""

# ╔═╡ d9ac9438-cc16-43b6-b215-8751f41dc185
md"""
一个创建向量(1, 2, ..., n)的快捷方式是`collect(1:n)`；更一般地，如果`m`和`n`都是整数，`m:n`给出从`m`到`n`的整数序列（要求`m` ≤ `n`，如果想要降序，可以用`m:-1:n`）
"""

# ╔═╡ 2fda9488-86c0-47c7-98ab-ae67b2c00126
md"""
获取向量`v`的第`i`个元素可以使用`v[i]`。也可以轻松获取子向量：
"""

# ╔═╡ 7fe6f3f5-32b8-4fc0-b91b-903f3d754e45
v[[1, 3, 5]]

# ╔═╡ ea7c436e-1862-4b65-89ee-19c4f1fd689b
md"""
`v[[1, 3, 5]]`给出一个由**v**第1个、第3个和第5个元素组成的向量。还可以通过指定排除哪些元素来获取子向量，需要使用[InvertedIndices](https://github.com/JuliaData/InvertedIndices.jl)包中的`Not`：
"""

# ╔═╡ c6b0ab15-34ae-40c1-b4f3-3c8661d1d3b6
v[Not(2:4)]

# ╔═╡ 425b93b6-eeee-4498-8f73-ea14a99408d8
md"""
`v[Not(2:4)]`给出一个剔除了**v**中第2个到第4个元素的向量。
"""

# ╔═╡ 50bf1793-2d53-4ca2-bbc0-9c3c72b535c0
md"""
Julia支持[广播机制](https://docs.julialang.org/en/v1/manual/arrays/#Broadcasting)，能够将操作应用于向量的元素上（广播机制能做的远不止这件小事，具体参见帮助文档。感谢APL）。例如，在数学中一个向量的立方没有标准定义，但在Julia中，输入`v.^3`（注意`.`号，表示广播）将轻松地对**v**中每个元素求立方。类似地，
"""

# ╔═╡ 6ce00df4-9d5c-4339-b1e0-8511e370797b
1 ./ (1:100).^2

# ╔═╡ f6d36f7d-90ac-4d2d-9f9d-470b8d47fb9e
md"""
`1 ./ (1:100).^2`是一个获取向量$(1, \frac 1 {2^2}, \frac 1 {3^2}, ..., \frac 1 {100^2})$的极紧凑方式。
"""

# ╔═╡ 56a58f8c-043e-45d0-8660-1dac9a8d8fec
md"""
Julia不支持R中的*向量循环利用*。
"""

# ╔═╡ 9086dc88-7f38-49a3-a491-1ea2efa280a2
md"""
# 阶乘和二项式系数
"""

# ╔═╡ 9152f6e8-c760-4863-8c64-7c8ce9fc5d44
md"""
我们使用`factorial(n)`计算$n!$，`binomial(n, k)`计算$\binom{n}{k}$。如我们所见，阶乘增长的极快。在Julia中，$n$超过$20$基本就会报错，此时应该使用[BigInt](https://docs.julialang.org/en/v1/base/numbers/#Base.GMP.BigInt)。要计算$\log{n!}$和$\log \binom n k$，可以使用[SpecialFunctions](https://github.com/JuliaMath/SpecialFunctions.jl)中的`logfactorial`和`logabsbinomial`。
"""

# ╔═╡ d819770f-f462-4e50-a7bc-8934a892ca5a
md"""
# 抽样和模拟
"""

# ╔═╡ 17adc664-13e3-458c-b4e5-68e96eec3c37
md"""
[StatsBase](https://juliastats.org/StatsBase.jl/stable/)包中的`sample`函数可用于随机抽样。例如，
"""

# ╔═╡ 5e58c1e9-5f88-4f73-9910-fda054c1147f
n = 10; k = 5;

# ╔═╡ d5712972-7368-4955-a26b-32d5672f3c44
sample(1:n, k, replace=false)

# ╔═╡ dbef6e06-ed77-4425-9db6-f59331322369
md"""
`sample`生成一个从1到10抽取5个数字的有序随机样本，采用无替代抽样，每个数字等概率。要使用有替代抽样，使用参数`replace=true`，或者省略`replace`参数（默认是`true`）。
"""

# ╔═╡ 1b48dd2b-431d-40ae-9e99-7a5014ffba8c
sample(1:n, k)

# ╔═╡ 2828c7b7-dbc9-442e-88b5-64a2c2a855dc
md"""
要生成$1, 2, ..., n$的随机排列，可以使用`sample(1:n, n, replace=false)`。
"""

# ╔═╡ 656281bf-8e68-480b-bccc-3ade075ef178
md"""
我们也可以使用`sample`从非数值集合中抽样。例如，通过`sample('a':'z', 7, replace=false)`生成7个随机字母组成的单词，采用无替代抽样（生成的是7个字母的向量，要想得到字符串，可以再使用`join`函数）。
"""

# ╔═╡ feb96410-acbc-4a4b-b3a7-dc4358a1744b
md"""
`sample`函数还允许我们指定每个数字的采样概率。例如，
"""

# ╔═╡ bf9b704a-dc14-4868-aead-c5fd1e749619
sample(1:4, ProbabilityWeights([0.1, 0.2, 0.3, 0.4]), 3)

# ╔═╡ 5c6456ae-5f6e-485a-a776-ffa4793e7727
md"""
从1到4中随机有替代抽取3个数字，采样概率为(0.1, 0.2, 0.3, 0.4)。如果采用无替换抽样，那么在每个阶段，任何尚未选择的数字的概率与其原始概率成正比。
"""

# ╔═╡ 786ae5aa-aa28-4540-8c6b-d05ff642c787
md"""
生成*许多*随机样本使我们能够对概率问题进行*模拟*。[推导式](https://docs.julialang.org/en/v1/manual/arrays/#man-comprehensions)，下面将会介绍，是一种很方便的实现模拟方法。
"""

# ╔═╡ 933dee24-8448-4d33-9ce3-db42ad82dc1a
md"""
# 匹配问题模拟
"""

# ╔═╡ 84feb4fa-d0b4-4939-b172-6ff09cad7468


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

julia_version = "1.13.2"
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
git-tree-sha1 = "b2d91fe939cae05960e760110b328288867b5758"
registries = "General"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.6"

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
git-tree-sha1 = "ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d"
registries = "General"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.0"

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
# ╟─4623521d-487a-46f8-b3d8-184c17d176f8
# ╟─0008eb20-ca8d-11f1-a675-dd03da3fae8f
# ╠═547b55fa-84ed-4b9b-a775-8ae5b356659d
# ╟─95a6552d-efa1-4c4e-8e03-1a44c98585c4
# ╠═b76ba786-e54f-4f04-bc96-483a649a0d4d
# ╟─d23c2f8e-c30e-4e4f-a9d3-91557fde5729
# ╟─d9ac9438-cc16-43b6-b215-8751f41dc185
# ╟─2fda9488-86c0-47c7-98ab-ae67b2c00126
# ╠═7fe6f3f5-32b8-4fc0-b91b-903f3d754e45
# ╟─ea7c436e-1862-4b65-89ee-19c4f1fd689b
# ╠═71517291-ed97-4dff-8dfd-3ca260ca3c54
# ╠═c6b0ab15-34ae-40c1-b4f3-3c8661d1d3b6
# ╟─425b93b6-eeee-4498-8f73-ea14a99408d8
# ╟─50bf1793-2d53-4ca2-bbc0-9c3c72b535c0
# ╠═6ce00df4-9d5c-4339-b1e0-8511e370797b
# ╟─f6d36f7d-90ac-4d2d-9f9d-470b8d47fb9e
# ╟─56a58f8c-043e-45d0-8660-1dac9a8d8fec
# ╟─9086dc88-7f38-49a3-a491-1ea2efa280a2
# ╟─9152f6e8-c760-4863-8c64-7c8ce9fc5d44
# ╟─d819770f-f462-4e50-a7bc-8934a892ca5a
# ╟─17adc664-13e3-458c-b4e5-68e96eec3c37
# ╠═759b1cc7-00c7-4722-8c60-c6e67712d1cf
# ╠═5e58c1e9-5f88-4f73-9910-fda054c1147f
# ╠═d5712972-7368-4955-a26b-32d5672f3c44
# ╟─dbef6e06-ed77-4425-9db6-f59331322369
# ╠═1b48dd2b-431d-40ae-9e99-7a5014ffba8c
# ╟─2828c7b7-dbc9-442e-88b5-64a2c2a855dc
# ╟─656281bf-8e68-480b-bccc-3ade075ef178
# ╟─feb96410-acbc-4a4b-b3a7-dc4358a1744b
# ╠═bf9b704a-dc14-4868-aead-c5fd1e749619
# ╟─5c6456ae-5f6e-485a-a776-ffa4793e7727
# ╟─786ae5aa-aa28-4540-8c6b-d05ff642c787
# ╟─933dee24-8448-4d33-9ce3-db42ad82dc1a
# ╠═84feb4fa-d0b4-4939-b172-6ff09cad7468
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
