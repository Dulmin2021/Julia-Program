# Import necessary packages
using CSV
using DataFrames
using Plots

# Read the CSV file into a DataFrame
data = CSV.read("data.csv", DataFrame)

# Display the first few rows of the DataFrame
println("Data Preview:")
println(first(data, 5))

# Perform basic data manipulation
# Calculate the average salary per city
average_salary_per_city = combine(groupby(data, :City), :Salary => mean => :AverageSalary)

# Display the results
println("\nAverage Salary per City:")
println(average_salary_per_city)

# Plot the average salary per city
bar(average_salary_per_city.City, average_salary_per_city.AverageSalary, title="Average Salary per City", xlabel="City", ylabel="Average Salary (\$)", legend=false)

# Save the plot as a PNG file
savefig("average_salary_per_city.png")

# Show the plot
display(plt)
