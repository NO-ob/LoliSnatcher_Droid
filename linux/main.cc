#include "my_application.h"

/**
 * main:
 * @argc: The number of command-line arguments.
 * @argv: The array of command-line arguments.
 *
 * The entry point of the application. It creates a new instance of
 * #MyApplication and runs the application using `g_application_run`.
 * This function manages the lifecycle of the application, including
 * command-line arguments and the main GTK event loop.
 *
 * Returns: The exit status of the application (0 for success).
 */
int main(int argc, char** argv) {
  // Automatically handles memory management for 'app' by using g_autoptr.
  g_autoptr(MyApplication) app = my_application_new();

  // Run the application and start the main event loop.
  // The exit status will be returned when the application finishes.
  return g_application_run(G_APPLICATION(app), argc, argv);
}
