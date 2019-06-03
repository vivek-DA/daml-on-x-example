# DAML-on-X Example Ledger Implementation

This repository contains an example [DAML
ledger](https://docs.daml.com/concepts/ledger-model/index.html) implementation
using [DAML Integration
Kit](https://docs.daml.com/daml-integration-kit/index.html).

## Development

This is a Scala / sbt project. To compile it run:

    sbt compile

To run it execute:

    sbt run

Eventually, this will launch a server, which exposes [Ledger
API](https://docs.daml.com/app-dev/ledger-api-introduction/index.html) and
implements a DAML ledger. It listens on port 6865 by default.

## Testing

The DAML Integration kit describes how to test the conformance of your ledger
server
[here](https://docs.daml.com/daml-integration-kit/index.html#integration-kit-testing).

You can test the server in this example as per that approach by running

    make it



## Dependencies

| Function | Tool | Version | Link |
| --- | --- | --- | --- |
| Solidity Compiler | `solc` | 0.5.9 | https://github.com/ethereum/go-ethereum/wiki/Contract-Tutorial#install-solc-on-ubuntu |
| Java Builds | `gradle` | 5.4.1 | https://docs.gradle.org/current/userguide/installation.html |

