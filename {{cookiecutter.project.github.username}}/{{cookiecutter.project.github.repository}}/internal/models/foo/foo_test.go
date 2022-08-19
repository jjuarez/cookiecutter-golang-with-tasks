package foo

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestExample(t *testing.T) {
	assert := assert.New(t)
	expected := Text
	got := Get()

	assert.Equal(expected, got, "This data must be the same")
}
