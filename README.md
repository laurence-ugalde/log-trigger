# Log trigger

**Log trigger** is a a pattern to create a [trigger](https://en.wikipedia.org/wiki/Database_trigger) to automatically store historical information
of a table in a relational database.

It works on a parallel table, creating infomation in a scheme of [tuple versioning](https://en.wikipedia.org/wiki/Tuple-versioning).

More detailed information: Log trigger in [Wikipedia](https://en.wikipedia.org/wiki/Log_trigger).

## Repository

The intention of this repository is to mantain the definition of the **Log trigger** in as many database providers as possible,
given that they use very different syntax and semantics, specially for triggers.

Currently, we have the defintition for the following database providers:

* **IBM DB2**
* **Microsoft SQL Server**
* **MySQL**
* **Oracle**

## License

Log trigger is licensed under the [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) license, so you can use it freely,
even for commercial purposes, provided you give appropriate credit to the author.

Shield: [![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg

## Contributing

If you know how to implement the Log trigger in a database provider other than those maintained in this repository, feel free to
request a pull.
