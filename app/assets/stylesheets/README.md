# UpHex Styles

## Methodology

CSS has its pros and cons. UpHex Styles are about embracing the pros - terse syntax, SCSS augmentations, etc. - while mitigating the cons - cascading and selector chaining - to make writing and maintaining our CSS easier.

With that in mind we've adopted some practices from other developers and teams to help us with this. The core rules:

- Follow [BEM naming conventions](https://en.bem.info/method/naming-convention/) for selector naming and organization (more on this later)
- Leave comments wherever you can, especially for clever CSS tricks and hacks that might confuse others
- Keep the number of descendants in a selector to a minimum, ideally know more than two elements deep
- Don't rely on the cascade/inheritance for your values as it leads to side-effects when changing CSS. Example: if your `h1.header__title` needs a `margin-bottom: 15px` and `h1` has the `margin-bottom: 15px` you need, write that rule for `.header__title` as well.
- Unsound CSS that has a lot of hacks or nasty selectors should be placed in the Shamefile so they can be tracked easier for refactoring

## BEM and Organization

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
