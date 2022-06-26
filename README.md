# Log trigger

**Log trigger** is a a pattern to create a [trigger](https://en.wikipedia.org/wiki/Database_trigger) to automatically store historical information
of a table in a relational database.

It works on a parallel table, creating infomation in a scheme of [tuple versioning](https://en.wikipedia.org/wiki/Tuple-versioning).

More detailed info: Log trigger in [Wikipedia](https://en.wikipedia.org/wiki/Log_trigger).

## Repository

The intention of this repository is to mantain the definition of the Log Trigger in as many database providers as possible,
given that they use very different syntax and semantics, specially for triggers.

## Contributing

If you know how to implement the Log trigger in a database provider other than those maintained in this repository, feel free to
request a pull.
