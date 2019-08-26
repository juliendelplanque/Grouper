# Grouper
[![Build Status](https://travis-ci.org/juliendelplanque/Grouper.svg?branch=master)](https://travis-ci.org/juliendelplanque/Grouper)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A library to group collections on an arbitrary number of levels for Pharo.

## Install

```Smalltalk
Metacello new
  repository: 'github://juliendelplanque/Grouper/src';
  baseline: 'Grouper';
  load
```

## Examples
### Getting started
The following code snippet using Grouper:

```Smalltalk
(10 to: 50) groupUsing: [ :integer | integer asString first ].
"an OrderedDictionary(
  $1->#(10 11 12 13 14 15 16 17 18 19)
  $2->#(20 21 22 23 24 25 26 27 28 29)
  $3->#(30 31 32 33 34 35 36 37 38 39)
  $4->#(40 41 42 43 44 45 46 47 48 49)
  $5->#(50))"
```

is equivalent to the following code snippet using built-in `#groupedBy:` method:

```Smalltalk
(10 to: 50) groupedBy: [ :integer | integer asString first ]
"an OrderedDictionary(
  $1->#(10 11 12 13 14 15 16 17 18 19)
  $2->#(20 21 22 23 24 25 26 27 28 29)
  $3->#(30 31 32 33 34 35 36 37 38 39)
  $4->#(40 41 42 43 44 45 46 47 48 49)
  $5->#(50))"
```

The power of Grouper is that group description are first-class object.
Thus, it is possible to compose group descriptions in order to group on multiple levels.

For example:

```Smalltalk
groupComposition := [ :integer | integer asString first ] grouper , [ :integer | integer asString second ].
(10 to: 50) groupUsing: groupComposition.
"an OrderedDictionary(
  $1->an OrderedDictionary(
    $0->#(10) $1->#(11) $2->#(12) $3->#(13) $4->#(14) $5->#(15) $6->#(16) $7->#(17) $8->#(18) $9->#(19))
  $2->an OrderedDictionary(
    $0->#(20) $1->#(21) $2->#(22) $3->#(23) $4->#(24) $5->#(25) $6->#(26) $7->#(27) $8->#(28) $9->#(29))
  $3->an OrderedDictionary(
    $0->#(30) $1->#(31) $2->#(32) $3->#(33) $4->#(34) $5->#(35) $6->#(36) $7->#(37) $8->#(38) $9->#(39))
  $4->an OrderedDictionary(
    $0->#(40) $1->#(41) $2->#(42) $3->#(43) $4->#(44) $5->#(45) $6->#(46) $7->#(47) $8->#(48) $9->#(49))
  $5->an OrderedDictionary($0->#(50)))"
```

### Building a tree
In fact, Grouper builds a tree. By default, it uses dictionaries for its nodes and the initial object in the collection for its leaves.

Grouper provides the ability to customize the kind of objects the tree is built of.
This is achived via `#leafCollect:`, `#nodeCollect:` and `#wrapRoot:`.

#### `#leafCollect:`
`#leafCollect:` allows one to customize the objects that will appear as leaves in the tree.
It is used as follow:

```Smalltalk
grouper := [ :integer | integer asString first ] grouper , [ :integer | integer asString second ] grouper.

grouper leafCollect: [ :result | GTreeLeafMock new content: result; yourself ]. 

(10 to: 15) groupUsing: groupComposition.
"an OrderedDictionary(
  $1->an OrderedDictionary(
    $0->an Array(a GTreeLeafMock)
    $1->an Array(a GTreeLeafMock)
    $2->an Array(a GTreeLeafMock)
    $3->an Array(a GTreeLeafMock)
    $4->an Array(a GTreeLeafMock)
    $5->an Array(a GTreeLeafMock)))"
```

#### `#nodeCollect:`
`#nodeCollect:` allows one to customize the objects that will appear as nodes in the tree.
It is used as follow:

```Smalltalk
groupComposition := [ :integer | integer asString first ] grouper , [ :integer | integer asString second ] grouper.

groupComposition nodeCollect: [ :dictionary |
	dictionary associations collect: [ :association |
		GTreeNodeMock new
			content: association key;
			children: association value
			yourself ] ]. 

(10 to: 15) groupUsing: groupComposition.
"an Array(a GTreeNodeMock)"
```

#### `#rootWrap:`
`#rootWrap:` allows one to customize the object used to wrap the tree at its root.
It is used as follow:

```Smalltalk
groupComposition := [ :integer | integer asString first ] grouper , [ :integer | integer asString second ] grouper.
	
groupComposition rootWrap: [ :array | GTreeRoot new children: array; yourself ].

(10 to: 15) groupUsing: groupComposition.
 "a GTreeRoot"
```
