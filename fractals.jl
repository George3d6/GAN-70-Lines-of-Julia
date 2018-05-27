function julia(x, y, width, height, c)
    # Scale the values of x and y to generate the fractal within our frame
    z = ((y/width)*2.7 - 1.3) + ((x/height)*4.5 - 2.5)im
    for i = 1:255
        z = z^2 + c
        if abs(z) >= 4
           return i
        end
    end
    return -255
end


julia_set(height, width, c) = [julia(x, y, width, height, c) for x = 1:height, y = 1:width]

function get_training_data(n)
    height = 256
    width = 256
    data = []
    for i=1:n
        c = 1.2e^((n/13)*π*im)
        push!(data, julia_set(height, width, c))
    end
    return data
end
