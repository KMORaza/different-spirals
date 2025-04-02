// Function to generate Calkin-Wilf sequence and plot as spiral
function calkin_wilf_spiral(n_terms)
    // Initialize arrays for numerators and denominators
    num = zeros(1, n_terms);
    den = zeros(1, n_terms);
    
    // First term is 1/1
    num(1) = 1;
    den(1) = 1;
    
    // Generate Calkin-Wilf sequence
    for i = 2:n_terms
        if floor(num(i-1)/den(i-1)) == num(i-1)/den(i-1) then
            // If previous term is an integer
            num(i) = num(i-1);
            den(i) = num(i-1) + den(i-1);
        else
            // Standard Calkin-Wilf transformation
            a = floor(num(i-1)/den(i-1));
            num(i) = num(i-1) - a * den(i-1);
            den(i) = den(i-1);
        end
    end
    
    // Convert to spiral coordinates
    theta = linspace(0, 4*%pi, n_terms);  // Angle for spiral
    r = sqrt(1:n_terms);                 // Radius increases with square root
    
    // Convert to Cartesian coordinates
    x = r .* cos(theta);
    y = r .* sin(theta);
    
    // Create the plot
    f = figure();
    set(f, "background", 8);  // White background
    
    // Plot the spiral
    plot(x, y, 'b-', 'LineWidth', 1);
    
    // Plot points with fraction labels
    for i = 1:n_terms
        plot(x(i), y(i), 'ro', 'MarkerSize', 5);
        // Add fraction labels (simplified to avoid clutter)
        if modulo(i, 5) == 0 then  // Label every 5th point to avoid overcrowding
            label = string(num(i)) + "/" + string(den(i));
            xstring(x(i), y(i), label);
        end
    end
    
    // Set plot properties
    a = gca();
    a.isoview = "on";      // Equal aspect ratio
    a.box = "off";         // Remove box
    a.axes_visible = "off"; // Hide axes
    
    // Adjust limits with padding
    xlim([min(x)-1 max(x)+1]);
    ylim([min(y)-1 max(y)+1]);
    
    // Add title
    title("Calkin-Wilf Spiral");
end

// Execute with 50 terms
calkin_wilf_spiral(50);
