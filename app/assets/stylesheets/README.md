# UpHex Styles

We use [BEM naming conventions](https://en.bem.info/method/naming-convention/) for organizing our CSS and order rules to have an ideal [specifity graph](http://csswizardry.com/2014/10/the-specificity-graph/). With that as the foundation we organize our each SCSS file in the following structure:

- comment describing the purpose of the block

- mixins, keyframes, etc.

- block selector

  - block properties

  - block pseudo rules

    - block pseudo media queries

  - element rules

    - element pseudo rules

    - element adopted child rules

    - element modifier rules

    - element media queries

  - block adopted child rules

  - modifier rules

    - modifier pseudo rules

    - modifier adopted child rules

    - modifier media queries

  - block media queries

As you write your CSS also leave comments explaining certain rules or declarations if you believe nobody other than you would understand them without some serious study.
