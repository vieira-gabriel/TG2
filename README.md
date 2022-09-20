# TG2

## Esquemático da planta real

```mermaid
graph LR
    A(Bomba 1) --> |Válvula 1| C(Tanque 1)
    B(Bomba 2) --> |Válvula 2| D(Tanque 2)
    B --> |Válvula 3| E(Tanque 3)
    A --> |Válvula 4| F(Tanque 4)
    C --> E
    D --> F
    E --> G(Reservatório)
    F --> G(Reservatório)
    G --> A
    G --> B
  
  ```
  [mermaid site](https://mermaid.live/)
