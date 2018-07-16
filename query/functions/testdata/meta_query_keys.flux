from(db:"test")
    |> range(start:-5m)
    |> filter(fn: (r) => r._measurement == "cpu")
    |> keys() 
    |> yield(name:"0")

from(db:"test")
    |> range(start:-5m)
    |> filter(fn: (r) => r._measurement == "cpu")
    |> group(by: ["host"])
    |> distinct(column: "host")
    |> group(none:true)
    |> yield(name:"1")