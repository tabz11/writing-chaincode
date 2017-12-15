package main

import (
	"testing"
)

func TestMonetaryValue(t *testing.T) {

	money := &MonetaryValue{
		1234,
		456,
		"GBP",
	}

	expectedResult := "1234.456"
	actualResult := money.StringValue()
	if expectedResult != actualResult {
		t.Fatalf("Expected: %v Got: %v", expectedResult, actualResult)
	}

}
