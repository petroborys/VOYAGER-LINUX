# Global target; when 'make' is run without arguments, this is what it should do
all:  VOYAGER-LINUX
 
# These variables hold the name of the compilation tool, the compilation flags and the link flags
# We make use of these variables in the package manifest
CXX = g++
CXXFLAGS = -Wall -Iutils -Idata -Itools -I.

LIBS= -lmosquitto -lpthread -lssl -lcrypto
 
# This variable identifies all header files in the directory; we use it to create a dependency chain between the object files and the source files
# This approach will re-build your application whenever any header file changes. In a more complex application, such behavior is often undesirable
# DEPS = 
 
# This variable holds all source files to consider for the build; we use a wildcard to pick all files
SRCXX = $(wildcard *.cpp */*.cpp)
 
# This variable holds all object file names, constructed from the source file names using pattern substitution
OBJXX = $(patsubst %.cpp, %.o, $(SRCXX))

# This rule builds individual object files, and depends on the corresponding C++ source files and the header files
%.o: %.cpp $(DEPS)
		$(CXX) -c -o $@ $< $(CXXFLAGS)

# To build 'voyager-linux', we depend on the object files, and link them all into a single executable using the compilation tool
# We use automatic variables to specify the final executable name 'voyager-linux', using '$@' and the '$^' will hold the names of all the
# dependencies of this rule
VOYAGER-LINUX: $(OBJXX)
		$(CXX) -o $@ $^ $(LDFLAGS) $(LIBS)

# To clean build artifacts, we specify a 'clean' rule, and use PHONY to indicate that this rule never matches with a potential file in the directory
.PHONY: clean
 
clean:
		rm -f voyager-linux *.o */*.o