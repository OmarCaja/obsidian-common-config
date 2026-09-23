# Obsidian Cheat Sheet

Quick reference for Obsidian's Markdown syntax and linking features. Based on
the official [Obsidian Cheat Sheet](https://publish.obsidian.md/orbnetsys/z_template/Obsidian+Cheat+Sheet).

## Text formatting

| Syntax                   | Result            |
| ------------------------ | ----------------- |
| `*italic*` or `_italic_` | *italic*          |
| `**bold**`               | **bold**          |
| `***bold italic***`      | ***bold italic*** |
| `~~strikethrough~~`      | ~~strikethrough~~ |
| `` `inline code` ``      | `inline code`     |
| `==highlight==`          | ==highlight==     |

## Headings

```
#### Heading 4
##### Heading 5
###### Heading 6
```

Renders as:

#### Heading 4
##### Heading 5
###### Heading 6

## Lists

```
- Bullet item
  - Nested item
1. Numbered item
- [ ] Unchecked task
- [x] Checked task
```

Renders as:

- Bullet item
  - Nested item
1. Numbered item
- [ ] Unchecked task
- [x] Checked task

## Blockquotes and callouts

```
> A blockquote
> spanning multiple lines

> [!note]
> A callout box. Types include note, tip, warning, danger, info, question, example.

> [!note]- Collapsible callout
> Add a `-` (collapsed) or `+` (expanded) after the type to make it foldable.

> [!question] Custom title
> The text after the type becomes the callout's title instead of "Question".

> [!tip]
> Callouts can be nested:
> > [!warning]
> > Like this.
```

Renders as:

> A blockquote
> spanning multiple lines

> [!note]
> A callout box. Types include note, tip, warning, danger, info, question, example.

> [!note]- Collapsible callout
> Add a `-` (collapsed) or `+` (expanded) after the type to make it foldable.

> [!question] Custom title
> The text after the type becomes the callout's title instead of "Question".

> [!tip]
> Callouts can be nested:
> > [!warning]
> > Like this.

Custom callout types and colors are defined in CSS — see
[Obsidian's callout docs](https://obsidian.md/help/callouts#Customize+callouts).

## Links

| Syntax                        | Result                            |
| ----------------------------- | --------------------------------- |
| `[text](url)`                 | Markdown link to an external URL  |
| `[[Note name]]`               | Wikilink to another note          |
| `[[Note name\|display text]]` | Wikilink with custom display text |
| `[[Note name#Heading]]`       | Link to a specific heading        |
| `[[Note name#^block-id]]`     | Link to a specific block          |

Renders as: [Obsidian](https://obsidian.md), [[Template]], [[Template|a note with custom text]].

## Embeds

| Syntax                     | Result                          |
| -------------------------- | ------------------------------- |
| `![[Note name]]`           | Embed a whole note              |
| `![[Note name#Heading]]`   | Embed a specific section        |
| `![[image.png]]`           | Embed an image                  |
| `![[image.png\|300]]`      | Embed an image at a given width |
| `![[document.pdf#page=3]]` | Embed a PDF at a given page     |

## Tables

```
| Column A | Column B |
|---|---|
| value | value |
```

Renders as:

| Column A | Column B |
|---|---|
| value | value |

Tables can also be inserted from the editor's right-click menu.

## Code blocks

````
```js
console.log("hello")
```
````

Renders as:

```js
console.log("hello")
```

## Other

- `---` on its own line renders a horizontal rule, like the one below

---

- Frontmatter (YAML properties) goes between `---` fences at the very top of a note:

  ```yaml
  ---
  tags: [example]
  ---
  ```

- `%%comment%%` hides text from preview mode — for example, this sentence hides a secret: %%the secret%% (switch to Reading view to see it vanish)
