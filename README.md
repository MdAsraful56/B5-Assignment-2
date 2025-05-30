# B5-Assignment-2



## 01. What is PostgreSQL ?

PostgreSQL হল একটি  উন্নত, ফ্রি, ওপেন সোর্স রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম (RDBMS)। এই ডাটাবেজে রিলেশনাল (SQL)  এবং নন- রিলেশনাল (JSON)  উভয় ধরনের কোয়ারি বা ডাটা সমর্থন করে।  এটি হলো ডায়নামিক ওয়েবসাইট বা মোবাইল অ্যাপ্লিকেশন বা ওয়েব এপ্লিকেশন এর জন্য একটি ব্যাক-এন্ড ডাটাবেজ হিসাবে ব্যবহৃত হয়।





## 02. Explain the `Primary Key` and `Foreign Key` concepts in PostgreSQL

###  🔑 Primary Key 

PostgreSQL এ Primary Key 🗝 হলো এমন একটি কলাম বা একাধিক কলামের সমন্বয়ে গঠিত একটি কলাম যা একটি টেবিলের প্রত্যেকটি রেকর্ডকে আলাদাভাবে শনাক্ত করে। এই ঈদে অবশ্যই ইউনিক মান থাকতে হবে ও কখনো নাল হতে পারবে না। সাধারণত একটি টেবিলে একটি মাত্র Primary Key কলাম থাকা উচিত এতে করে ডাটার সঠিকতা বজায় থাকে। ঐ  Key মাধ্যমে ওই ডাটা কে আলাদাভাবে চিহ্নিত করা যায় বা সহজে খোঁজা যায়। 


### 🗝️ Foreign Key


PostgreSQL এ Foreign Key 🗝  হলো অন্য কোন একটি টেবিলের Primary Key । দুইটি টেবিলের মধ্যে সম্পর্ক করার জন্য এই Foreign Key ব্যবহার করা হয়ে থাকে। এর মাধ্যমে দুটি টেবলের মধ্যে সংযোগ বজায় থাকে। আর Foreign Key তে যে মান থাকিবে, তা সংশ্লিষ্ট টেবিলের Primary Key তে আগে থেকেই থাকিতে হবে।




## 03. What is the difference between the `VARCHAR` and `CHAR` data types ?

`CHAR` এ  নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে। এটা সংজ্ঞায়িত করা হবে তখন যেই  দৈর্ঘ্য দেওয়া হবে সবগুলো ডাটার ক্ষেত্রে একই পরিমাণ দৈর্ঘ্য নিবে  যদি ফাঁকা থাকে তাও ফাঁকা জায়গায় রেখে একই পরিমাণ দৈর্ঘ্য নেবে। 


`VARCHAR` এ পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে। এটি যখন সংজ্ঞায়িত করা হবে তখন যেই দৈর্ঘ্য দেওয়া হবে সবগুলো ডাটার ক্ষেত্রে শুধুমাত্র যতটুকু দৈর্ঘ্য প্রয়োজন অতটুকুই দৈর্ঘ্য নেবে।



| বৈশিষ্ট্য      | CHAR      | VARCHAR      |
| ----- | --------------------- | -------------------- |
| দৈর্ঘ্য     | Fixed-length     | Variable-length            |
| স্টোরেজ | সব সময় নির্দিষ্ট ক্যারেক্টার | যতটুকু string এর দৈর্ঘ্য ততটুকু   |
| ফাঁকা জায়গা | Padding করে পূর্ণ হয় | না, যতটুকু লাগে ততটুকু নেয় |
| ব্যবহার উপযোগী | কোন নির্দিষ্ট কোড | নাম, ঠিকানা, ইত্যাদি    |




## 04. What are the `LIMIT` and `OFFSET` clauses used for ?

PostgreSQL এ `LIMIT` ব্যবহার করে নির্ধারণ করা হয় ডেটাবেজ থেকে কতগুলো ডাটা দেখতে হবে।  আর অন্যদিকে `OFFSET` ব্যবহার করে নির্ধারণ করা হয় কোথা থেকে ডাটা দেখানো শুরু করা হবে।


### 🖋️ LIMIT

একটি কোয়ারির  মাধ্যমে সর্বোচ্চ কতগুলো ডাটা দেখানো যাবে তা নির্ধারণ করা হয়।

```Limit code 
SELECT * FROM employees LIMIT 5;
```





### 🖋️ OFFSET

প্রথমে কয়টি ডাটা বাদ দিয়ে শুরু করতে হবে তা নির্ধারণ করা হয়।

```Offset code 
SELECT * FROM employees OFFSET 5;
```


### 🖋️ LIMIT ও OFFSET 

এগুলো ব্যবহার করে সাধারণত বিভিন্ন ওয়েবসাইটের Pagination এর জন্য। Pagination হল অল্প অল্প করে বিভিন্ন পাতায় ডাটা দেখানো।

```
SELECT * FROM employees LIMIT 20 OFFSET 20 * 0;  // Output: (01-20)
SELECT * FROM employees LIMIT 20 OFFSET 20 * 1;  // Output: (21-40)
SELECT * FROM employees LIMIT 20 OFFSET 20 * 2;  // Output: (41-60)
```



## 05. Explain the `GROUP BY` clause and its role in aggregation operations.

GROUP BY  ব্যবহার করা হয় যখন আপনার একই টেবিলের এক বা একাধিক কলমের মান অনুযায়ী রেকর্ডগুলো একত্রিত হয়ে গ্রুপে তৈরি হবে ।  এটি মূলত COUNT, SUM, AVG,  MAX, MIN এই ফাংশনগুলোর সাথে একত্রে ব্যবহার করা হয় যাতে গ্রুপের ডাটা গুলো সার সংক্ষেপ্তে পাওয়া যায়।



🏷️ উদাহরণ : ---

```
SELECT department, AVG(salary) AS average_salary FROM employees
    GROUP BY department;
```

```
SELECT department, COUNT(*) FROM employees 
    GROUP BY department;
```

এখানে প্রত্যেকটি department কতজন employee আছে এটা বের করার জন্য GROUP BY department এবং COUNT(*) ব্যবহার করা হয়েছে।





## 06. How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in PostgreSQL ? 

PostgreSQL এ COUNT(), SUM(), AVG() এগুলো হলো Aggregate function এদের মাধ্যমে একাধিক সারির উপর বিভিন্ন গণনা করে একটি একক ফলাফল বের করা হয়।

### ➡️ `COUNT()` → মোট কয়টি সারি আছে তা গণনা করে 

```
SELECT COUNT(*) FROM students;
```



### ➕ `SUM()` → যোগফল বের করে

```
SELECT SUM(salary) FROM employees;
```

### ⚖️ `AVG()` → গড় (average) বের করে

```
SELECT AVG(age) FROM students;
```

## 