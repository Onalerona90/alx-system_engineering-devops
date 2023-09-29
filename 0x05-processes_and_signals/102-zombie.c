#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/**
 * infinite_while - Creates an infinite loop
 *
 * Return: Always 0 (never returns)
*/
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Entry point
 *
 * Description: This program creates 5 zombie processes
 * and enters an infinite loop.
 *
 * Return: Always 0 (Success).
*/
int main(void)
{
	int i;
	pid_t child_pid;

	for (i = 0; i < 5; i++)
	{
		child_pid = fork();

		if (child_pid == 0)
		{
			printf("Zombie process created, PID: %d\n", (int)getpid());
			exit(0);
		}
		else if (child_pid < 0)
		{
			perror("Fork error");
			exit(1);
		}
	}

	infinite_while();

	return (0);
}
