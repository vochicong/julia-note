### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ 4d22e1f6-9f96-4cf4-b3ec-97aaf1e401be
md" Tính xác suất di chuyển từ node $i$ đến node $j$ trong vòng $n$ steps trên Markov chain khi được cho ma trận $p$ với $p[i,j]$ thể hiện xác suất di chuyển trong trường hợp $n = 1$.
"

# ╔═╡ 1da7d8be-014b-11ec-1dea-0b2281bbd5ff
"Markov transition probability from state i to state j in n steps 
given probability p for n = 1.
"
transit_proba(p,i,j,n) = begin
	n > 1 || return p[i,j]
	path_proba(k) = transit_proba(p,i,k,n-1) * p[k,j]
	sum([path_proba(k) for k in 1:size(p,1)])
end

# ╔═╡ 4b9fb6e9-566f-4168-af90-1956967f5415
p = [
	.6 .1 .3
	.2 .7 .1
	.3 .3 .4
]

# ╔═╡ d02154ea-27f0-4e20-a064-0cc536dbbad2
transit_proba(p,1,1,3)

# ╔═╡ ef37880e-701e-446a-b877-91d202224e72
@assert size(p,1) == size(p,2)

# ╔═╡ Cell order:
# ╟─4d22e1f6-9f96-4cf4-b3ec-97aaf1e401be
# ╠═1da7d8be-014b-11ec-1dea-0b2281bbd5ff
# ╠═4b9fb6e9-566f-4168-af90-1956967f5415
# ╠═ef37880e-701e-446a-b877-91d202224e72
# ╠═d02154ea-27f0-4e20-a064-0cc536dbbad2
