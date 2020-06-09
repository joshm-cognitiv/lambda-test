#include <aws/lambda-runtime/runtime.h>
#include <iostream>
#include <sstream>

using namespace aws::lambda_runtime;

static invocation_response my_handler(invocation_request const& request)
{
	return invocation_response::success("{\"errors\":[]}", "application/json");
}

int main()
{
	run_handler(my_handler);
	return 0;
}
