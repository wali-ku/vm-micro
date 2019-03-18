#include <stdio.h>
#include <stdlib.h>

int main (int argc, void* argv [])
{
	int num_of_jumps = 5;
	int var_test = 0, var_control = 0, i = 0;
	volatile int target = 0;

	for (; i < num_of_jumps; ++i) {
		target = (rand () % num_of_jumps) + 1;
		var_control += target;

		switch (target) {
			case 1:
				var_test += target;
				break;

			case 2:
				var_test += target;
				break;

			case 3:
				var_test += target;
				break;

			case 4:
				var_test += target;
				break;

			case 5:
				var_test += target;
				break;

			case 6:
				var_test += target;
				break;

			case 7:
				var_test += target;
				break;

			case 8:
				var_test += target;
				break;

			case 9:
				var_test += target;
				break;

			case 10:
				var_test += target;
				break;

			default:
				printf ("[ERROR] Unexpected case\n!");
				exit -1;
				break;
		}

		if (var_control != var_test) {
			printf ("[ERROR] Mismatch found: control = %d | test = %d | Iteration = %d\n", var_control, var_test, i);
			exit -1;
		}
	}

	printf ("[STATUS] Successful Execution!\n");
	return 0;
}
