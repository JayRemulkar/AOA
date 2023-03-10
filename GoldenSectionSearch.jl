
f(x) = x^4 - 14*x^3 + 60x^2 - 70*x

function gss(f, a, b, N)
    # The golden ratio
    ϕ = (sqrt(5) - 1)/2.0
    ρ = 1-ϕ
    
    d = (1-ρ)*b + ρ*a
    fd = f(d)
    
    for i in 1:N
        c = ρ*b + (1-ρ)*a
        fc = f(c)
        
        if(fc < fd)
            d, b, fd = c, d, fc
        else 
            a, b = b, c
        end   
    end
    
    return a < b ? (a, b) : (b, a)
end

a, b = gss(f, 0.0, 2.0, 10)
println(a,b)
