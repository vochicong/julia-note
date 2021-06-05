### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ aeefaf63-7704-4553-99fb-40ee023066c7
begin
	import Pkg
	Pkg.activate(".")
	Pkg.add("Combinatorics")
	Pkg.add("PlutoUI")
	Pkg.add("StatsPlots")
	using Combinatorics
	using Random
	using PlutoUI
	using StatsPlots
	using Plots
	using Statistics
end

# ╔═╡ 4cd603f6-c5a8-11eb-0ca4-eb96025b7c96
md"""
# Tung mũ

## Vấn đề

Có $n$ người bạn thân đội mũ giống hệt nhau.
Họ đồng loạt tung mũ lên trời và mỗi người chụp lại đúng một cái.
Ai chụp được cái mũ nào là hoàn toàn ngẫu nhiên.
Hãy dự đoán số người $X$ chụp lại được đúng cái mũ mình đã đội lúc đầu,
với $n=1,2,3.$


## Phân tích

Trường hợp $n=1$, chỉ có đúng một khả năng duy nhất có thể xảy ra là $X=1,$ hiển nhiên giá trị trung bình và phương sai sẽ là

$\mathbb{E}[X] = 1, \mathbb{V}[X] = 0.$

Nếu $n\geq 2$, có $n!$ phương án gán (hoán vị) mũ cho mọi người, $X$ nhận các giá trị $0,1,\dots,n$, và có thể chứng minh được rằng

$\mathbb{E}[X] = 1, \mathbb{V}[X] = 1.$

Khi $n$ tương đối nhỏ, ta có thể liệt kê cụ thể tất cả các phương án để kiểm chứng mệnh đề trên.

## Thí nghiệm

Dưới đây giả sử $n$ khá lớn, ta sẽ thực hiện $m$ thí nghiệm tung mũ, với $m$ tương đối nhỏ so với số hoán vị $n!$, và khảo sát giá trị $x$ mà $X$ nhận được trong từng thí nghiệm.
"""

# ╔═╡ ad4e1909-f441-44af-be0e-6319ae4dc3aa
@bind n Slider(10:10:10_000, show_value=true)

# ╔═╡ f311bde5-128c-46e7-9ae8-a76b361e85c7
@bind m Slider(100:100:10_000, show_value=true)

# ╔═╡ 3b3cca81-8265-48e4-936a-1aee97be3fa7
md"""Tỷ lệ số lần thí nghiệm trên tổng số hoán vị $\frac{m}{n!}$ là
"""

# ╔═╡ 5d7324e7-32a5-4110-956f-9ce28e4c6387
m/factorial(big(n))

# ╔═╡ 5822fa84-1be9-4884-a93d-acd87e72dba5
hats = 1:n

# ╔═╡ d149737e-ce6f-4362-b67a-cb3d09f1448e
xs = begin
	# permutated_hats = permutations(hats)
	permutated_hats = (randperm(n) for i in 1:m)
	[sum(ph .== hats) for ph in permutated_hats]
end

# ╔═╡ ca6318ce-3393-4132-81c1-033e66dd1a89
begin
	diagrams = [
		scatter(xs, legend = false),
		histogram(xs, legend = false),
		boxplot(xs, legend = false),
		# density(xs, legend = false)
	]
	plot(diagrams..., layout=(3,1))
end

# ╔═╡ a0f88ad8-1934-411d-8d63-cdbfa18221ea
𝔼 = mean(xs)

# ╔═╡ f59e2d67-72f1-490c-9874-887f5f9fa492
𝕍 = std(xs)

# ╔═╡ Cell order:
# ╟─aeefaf63-7704-4553-99fb-40ee023066c7
# ╟─4cd603f6-c5a8-11eb-0ca4-eb96025b7c96
# ╟─ca6318ce-3393-4132-81c1-033e66dd1a89
# ╟─a0f88ad8-1934-411d-8d63-cdbfa18221ea
# ╟─f59e2d67-72f1-490c-9874-887f5f9fa492
# ╠═ad4e1909-f441-44af-be0e-6319ae4dc3aa
# ╠═f311bde5-128c-46e7-9ae8-a76b361e85c7
# ╟─3b3cca81-8265-48e4-936a-1aee97be3fa7
# ╟─5d7324e7-32a5-4110-956f-9ce28e4c6387
# ╟─5822fa84-1be9-4884-a93d-acd87e72dba5
# ╟─d149737e-ce6f-4362-b67a-cb3d09f1448e
