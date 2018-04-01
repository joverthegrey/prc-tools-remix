
from distutils.core import setup, Extension
from shutil import copy
from os import unlink

# messy, I know. Please fix if you know how!
copy("src/pisock.py", "pisock.py")

setup(name = "python-libpisock",
      version = "0.12.0",
      description = "Python binding for the pisock library.",
      author = "Rob Tillotson",
      author_email = "rob@pyrite.org",
      url = "http://www.pyrite.org/",

      ext_modules = [Extension("_pisock",["src/pisock_wrap.c"],
                               include_dirs=['../../include'],
                               library_dirs=['../../libpisock/.libs'],
                               libraries=['pisock'],
                               )
                     ],
      py_modules = ["pisock"],
      )

unlink("pisock.py")
