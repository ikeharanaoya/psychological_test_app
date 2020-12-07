# README
# テーブル設計
## problems テーブル
| Column | Type   | Options     |
|--------|--------|-------------|
| title  | string | null: false |
| text   | text   | null: false |

### Association
- has_many :questions
- has_many :scores

## questions テーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| number      | integer    | null: false                   |
| text        | text       | null: false                   |
| division_id | integer    | null: false                   |
| valuation   | integer    | null: false                   |
| inversion   | boolean    | null: false default: false    |
| problem     | references | null: false foreign_key: true |

### Association
- has_many :answers
- belongs_to :problem
- belongs_to :division

## answers テーブル
| Column   | Type       | Options                       |
|----------|------------|-------------------------------|
| answer   | integer    | null: false                   |
| question | references | null: false foreign_key: true |

### Association
- belongs_to :question
- has_many :scores_answers
- has_many :scores, through: :scores_answers

## scores テーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| count       | integer    | null: false                   |
| sum         | integer    | null: false                   |
| division_id | integer    | null: false                   |
| problem     | references | null: false foreign_key: true |
| user        | references | null: false foreign_key: true |

### Association
- belongs_to :problem
- belongs_to :division
- belongs_to :user
- has_many :scores_answers
- has_many :answers, through: :scores_answers

## scores_answers テーブル
| Column | Type       | Options                       |
|--------|------------|-------------------------------|
| answer | references | null: false foreign_key: true |
| score  | references | null: false foreign_key: true |

### Association

- belongs_to :score
- belongs_to :answer

## divisions テーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| division_id | integer    | null: false                   |
| text        | string     | null: false                   |
| problem     | references | null: false foreign_key: true |

### Association
- has_many :questions
- has_many :scores

## users テーブル
| Column             | Type   | Options     |
|--------------------|--------|-------------|
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |

### Association
- has_many :scores