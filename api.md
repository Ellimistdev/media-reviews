### Medium
```json
{
  "id": 1,
  "medium_type": "Series",
  "title": "The Painted Veil",
  "reviews": [
    {
      "id": 30,
      "content": "Corporis debitis cum qui.",
      "rating": "5",
      "reviewer": {
        "id": 14,
        "username": "Dr. Robby Rosenbaum"
      }
    }
  ],
  "children": [
    {
      "id": 40,
      "medium_id": 122,
      "title": "The Painted Veil - Season 1"
    }
  ],
  "parent": null
}
```
### Series
```json
{
  "id": 1,
  "medium_id": 1,
  "title": "The Painted Veil",
  "reviews": [
    {
      "id": 30,
      "content": "Corporis debitis cum qui.",
      "rating": "5",
      "reviewer": {
        "id": 14,
        "username": "Dr. Robby Rosenbaum"
      }
    }
  ],
  "children": [
    {
      "id": 40,
      "medium_id": 122,
      "title": "The Painted Veil - Season 1"
    }
  ]
}
```
### Season
```json
{
  "id": 3,
  "medium_id": 13,
  "title": "Antic Hay - Season 74",
  "reviews": [
    {
      "id": 22,
      "content": "Blanditiis quos voluptatem nesciunt.",
      "rating": "5",
      "reviewer": {
        "id": 3,
        "username": "Gonzalo Rau III"
      }
    }
  ],
  "children": [
    {
      "id": 17,
      "medium_id": 125,
      "title": "Fair Stood the Wind for France"
    }
  ],
  "parent": {
    "id": 6,
    "medium_id": 9,
    "title": "Antic Hay"
  }
}
```
### Episode
```json
{
  "id": 1,
  "medium_id": 14,
  "title": "Stranger in a Strange Land",
  "reviews": [
    {
      "id": 73,
      "content": "Dolor rem quidem officia.",
      "rating": "4",
      "reviewer": {
        "id": 17,
        "username": "Ms. Theda Bernier"
      }
    }
  ],
  "parent": {
    "id": 3,
    "medium_id": 13,
    "title": "Antic Hay - Season 74"
  }
}
```
### Movie
```json
{
  "id": 1,
  "medium_id": 8,
  "title": "To Your Scattered Bodies Go",
  "reviews": [
    {
      "id": 90,
      "content": "Saepe autem est doloribus.",
      "rating": "5",
      "reviewer": {
        "id": 42,
        "username": "Ellen Gislason V"
      }
    }
  ]
}
```
### Review
```json
{
  "id": 1,
  "content": "Pariatur error totam eum.",
  "rating": "4",
  "reviewer": {
    "id": 1,
    "username": "Williams DuBuque DDS"
  },
  "medium": {
    "id": 1,
    "medium_type": "Series",
    "title": "The Painted Veil"
  }
}
```
### View
```json
{
  "id": 1,
  "medium_id": 45,
  "user_id": 36,
  "title": "The Daffodil Sky"
}
```
### User
```json
{
  "id": 1,
  "username": "Williams DuBuque DDS",
  "reviews": [
    {
      "id": 1,
      "content": "Pariatur error totam eum.",
      "rating": "4",
      "medium_title": "The Painted Veil",
      "medium_id": 1
    }
  ],
  "views": [
    {
      "id": 36,
      "medium_id": 32,
      "title": "The Widening Gyre"
    }
  ]
}
```
#### User Reviews
```json
[
  {
    "id": 1,
    "content": "Pariatur error totam eum.",
    "rating": "4",
    "reviewer": {
      "id": 1,
      "username": "Williams DuBuque DDS"
    },
    "medium": {
      "id": 1,
      "medium_type": "Series",
      "title": "The Painted Veil"
    }
  }
]
```
#### User Views
```json
[
  {
    "id": 36,
    "medium_id": 32,
    "user_id": 1,
    "title": "The Widening Gyre"
  }
]
```