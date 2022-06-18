package main

import (
	"fmt"
	"math"
)

func findHypot(a int, b int) float64 {
	return math.Sqrt(float64(a*a + b*b))
}

func main() {
	fmt.Println(findHypot(12, 14))
}
