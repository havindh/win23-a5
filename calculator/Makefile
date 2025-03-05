CC = gcc
CFLAGS = -Wall -Werror -std=c11
OBJ = main.o addition.o subtraction.o multiplication.o division.o
EXEC = calculator

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(CFLAGS) -o $(EXEC) $(OBJ)

%.o: %.c operations.h
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(OBJ) $(EXEC)
