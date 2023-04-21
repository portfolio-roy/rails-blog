<a name="readme-top"></a>

<div align="center">
 
  <h3><b>Rails Blog: A simple blog application built with Ruby on Rails</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
    <!-- - [🚀 Live Demo](#live-demo) -->
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Rails Blog <a name="about-project"></a>

**Rails Blog** is a blog application made with Ruby on Rails.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li>RoR</li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Add/edit User**
- **Add/delete Post**
- **Add/delete Comment**
- **Add Like**
- **Call API**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

<!-- ## 🚀 Live Demo <a name="live-demo"></a>

- Not available yet

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need to have Rails and postgress installed on you computer.

### Setup

Clone this repository to your desired folder:

```sh
  git git@github.com:portfolio-roy/rails-blog.git
  cd rails-blog
```

### Install

- Install this project with:

```sh
  bundle install
```

- Change the postgress password with your own in `config/database.yml`
- Then run:

```sh
  rails db:create db:migrate
```

### Usage

Run the development server locally by:

```sh
  rails s
```

**User sign up**

- Go to the following link:
  https://localhost:3000/users/sign_up
- Fill up the form and submit
- Confirm the email address

**User login**

- Go to the following link:
  https://localhost:3000/users/sign_in
- Fill up the form and submit

**User edit**

- Go to the following link:
  https://localhost:3000/users/edit
- Fill up the form and submit

**Add a Post**

- Go to https://localhost:3000/
- Click on your username.
- The URL in you browser will be like `https://localhost:3000/users/<your user_id>`
- Append `/posts/new`. Now it will look like `https://localhost:3000/users/<your user_id>`. Hit enter.
- Fill up the form and submit

**Delete Post**

- Navigate to a specific post.
- Click on the delete button underneath the post's body.

**Add a Comment**

- Go to a specific post by clicking on it's title.
- Click on the comment button.
- Fill up the comment form and submit

**Like a post**

- Go to a specific post by clicking on it's title.
- Click on the like button.

**Sign out**

- Visit `https://localhost:3000/users/sign_out`

**API Endpooints**

- All posts from a user: `http://localhost:3000/users/<user.id>/posts.json`
- All comments of a post: `http://localhost:3000/users/<user.id>/posts/<post.id>/comments.json`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Utsargo Roy**

- GitHub: [@utsargo](https://github.com/utsargo)
- Twitter: [@royutsargo](https://twitter.com/royutsargo)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/utsargo-roy/)

👤 **IBRAHIM DIABY MOHAMED**

- GitHub: [@Dmambo](https://github.com/Dmambo)
- Twitter: [@kingibro345](https://twitter.com/kingibro345)
- LinkedIn: [Dmambo](https://linkedin.com/in/Dmambo)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Add Registration/Login links in the page**
- [ ] **Add `Create post` link in the user detail page**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please leave a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank my fellow micronauts.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
