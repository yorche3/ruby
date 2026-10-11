# frozen_string_literal: true

# data_structures_basics — Node, LinkedList, Stack y Queue.
#
# Especificación: 06_Data_Structures_Basics
#
# Contrato: cuatro clases bajo `DataStructuresBasics` con un único `Node`
# compartido; cada estructura nace vacía con `new` (el `init()` de la
# especificación) y no tiene capacidad.
#
# Adecuaciones:
#   - Indicadores de fallo de esta fase: las lecturas enteras que pueden fallar
#     (`head`, `peek`, `pop`, `dequeue`) devuelven **-1**; las booleanas
#     (`delete`, `empty?`) devuelven `true`/`false`. **Solo los enlaces**
#     (`Node#next`) usan `nil` como ausencia.
#   - Los accesores de `Node` y las operaciones de las tres estructuras son
#     esqueletos que devuelven su indicador natural y no lanzan excepciones:
#     el algoritmo es del paso 5.
#
# Estructura de gema: `lib/` para el código (entry point + un archivo por
# clase), `spec/` para RSpec, `data_structures_basics.gemspec`, `Gemfile` y
# `Rakefile`.

require_relative "data_structures_basics/version"
require_relative "data_structures_basics/node"
require_relative "data_structures_basics/linked_list"
require_relative "data_structures_basics/stack"
require_relative "data_structures_basics/queue"
