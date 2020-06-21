using Pkg: Pkg, @pkg_str
Pkg.activate(@__DIR__)
using Luxor

LL = 80
WW = 25

function srect(xmin, ymin, w, h, action)
   # return rect(xmin, ymin, w, h, action)
   return squircle(Point(xmin+w/2, ymin+h/2), w/2, h/2, action; rt=0.3)
end

function draw_tick()
    rotate(π/4)
    srect(-0,0, WW, LL, :fill)
    
    translate(WW, LL)
    rotate(π/2)
    srect(0,0, -WW, 2WW, :fill)
end

function with_matrix(f)
    m = getmatrix()
    f()
    setmatrix(m)
end

function draw_cross()
    CL = LL + WW
    rotate(π/4)
    srect(-0, 0, WW, CL, :fill)
    
    translate((CL+WW)/2, (CL-WW)/2)
    rotate(π/2)
    srect(-0, 0, 25, CL, :fill)
end


for filename in ("logo/logo.svg", "logo/logo.png")
    Drawing(300, 300, filename)
    origin()


    translate(75, -150)

    sethue(Luxor.julia_green)
    with_matrix(draw_tick)
    
    translate(0, 100)
    sethue(Luxor.julia_purple)
    with_matrix(draw_tick)

    translate(0, 100)
    sethue(Luxor.julia_red)
    with_matrix(draw_cross)


    finish()
    preview()
end
preview()