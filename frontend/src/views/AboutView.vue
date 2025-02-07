<template>
  <v-container>

        <!-- Page Title -->
        <div class="page-title">
            <div class="hero-image-wrapper">
                <div class="hero-image-text">
                    <h1>About Section</h1>
                </div>
                <img
                    class="hero-image"
                    :src="require('../assets/about-hero.png')"
                    alt="Events Hero"
                >
            </div>
            <div class="hero-subtext">
                <p>
                    This website was created as a custom project by Matthew Cross for the Swinburne
                    University of Technology Online Course - COS30043 Interface Design and
                    Development. This page will provide an overview of the project, the technologies
                    used, how the project meets the unit criteria, and what the next steps for the
                    project are.
                </p>
            </div>
        </div>

        <article>

            <DividerBar :text="'Overview'" class="divider-bar"/>

            <section>
                <h2>
                    <v-icon icon="mdi-hexagon-multiple" />
                    <span>Introduction</span>
                </h2>
                <p>
                    This is a project that I have been thinking about for a while now, and I am
                    very glad that I was able to work on it as part of this unit. Bandwidth is a
                    gig guide for the Melbourne music scene that will provide a complete list of
                    upcoming events, venues, and artists in Melbourne. This initial version of the
                    website is a proof of concept more than anything, showing the potential of the
                    idea and what it could become with more time and resources.
                </p>
                <p>
                    The website is built using Vue 3 and the Vuetify Material Design Framework.
                    The website is hosted on GitHub Pages, while the server and sqlite database are
                    hosted on Render. The website is a single page application that uses the Vue
                    Router to navigate between different views. The website is fully responsive and
                    supports mobile, tablet, and desktop devices. The website supports filtering and
                    searching for events, venues, and artists. User's can create an account and login
                    to save their favourite events, venues, and artists. Additionally, users can
                    create, update, delete, and like comments on any event, venue, or artist once
                    they are logged in.
                </p>
            </section>

            <section>
                <h2>
                    <v-icon icon="mdi-vector-link" />
                    <span>Links</span>
                </h2>
                <p>
                    The following links will take you to Lucidchart and Canva where you can view the
                    Entity Relationship Diagram and the Mobile and Desktop Design Prototypes for the
                    website. Please note that these links will open in a new tab.
                </p>
                <ul>
                    <li><a class="clickable" target="_blank" href="https://lucid.app/lucidchart/ef106a66-2b21-4603-b0e8-a0b71c9e5a8b/edit?invitationId=inv_84152621-20af-4d14-9ab8-9f0afbfa1df9&page=0_0#">ERD</a></li>
                    <li><a class="clickable" target="_blank" href="https://www.canva.com/design/DAGZTNcubuY/R9hzY4d9h-509wLeaN4RMA/edit?utm_content=DAGZTNcubuY&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton">Mobile Design Prototype</a></li>
                    <li><a class="clickable" target="_blank" href="https://www.canva.com/design/DAGZbU7cMz0/K4GXh9dyRNEHzH6VxZi8CA/edit?utm_content=DAGZbU7cMz0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton ">Desktop Design Prototype</a></li>
                </ul>
            </section>

            <section>
                <h2>
                    <v-icon icon="mdi-format-list-bulleted-type" />
                    <span>What is a Focus?</span>
                </h2>
                <p>
                    You'll see the idea of a Focus everywhere in the code for this website, so it
                    is important to understand what a Focus is. A Focus is a way of grouping together
                    a type of entity - an event, venue, or artist - and the corresponding ID for
                    that entity. This is used to create a consistent way of interacting with the
                    entities in the database, and to make it easier to create reusable components
                    that can be used across different parts of the website. For example, the
                    FocusCard component is a single component that can be used to will display different
                    types of information based on the Focus Type that it is given. This makes it
                    easier to create reusable components that can be used across different parts of
                    the website, and to create a consistent way of interacting with the entities in
                    the database.
                </p>
            </section>

        </article>

        <article>

            <DividerBar :text="'6.2 Distinction Criteria'" class="divider-bar"/>

            <!-- Context View Grouping -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Context View Grouping</span>
                </h2>
                <h3>
                    Demonstrate the use of context view grouping - implement the web application
                    with a structure of row-column grid system.
                </h3>
                <p>
                    This website is fully responsive and supports mobile, tablet, and desktop
                    devices. In places where they offer great sizing functionality out of the box,
                    I have used Vuetify components to create this dynamic layout. The most prominent
                    example of this the v-container which neatly wraps all main views and adjusts
                    the padding and margins based on the device size. This is a great example of
                    context view grouping as it groups all the main views together and adjusts the
                    layout based on the device size.
                </p>
                <p>
                    For each view and component, I have created dynamic layouts that adjust the size,
                    position, padding and visibility based on the device size. I won't point you
                    towards a specific example here, but rather I encourage you to resize the
                    browser (or open <a target="_blank" href="https://matthewleigh.github.io/bandwidth/">Bandwidth</a>
                    on your phone) and see how the layout changes based on the device size.
                </p>
                <p>
                    The specific requirement for this criteria was to make use of the row-column
                    grid system. This is a core feature of Vuetify that offers a simplistic way of
                    dynamically adjusting layouts to the screen size. To be honest with you, I hate
                    the row-column grid system. I find it very limiting and frustrating to work with.
                    I find that it significantly bloats the markup for each template, while
                    simultaneously limiting the flexibility by forcing you to use a specific number
                    of columns. I have made use of the row-column grid system in the
                    <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/blob/main/frontend/src/components/AppFooter.vue">footer</a>
                    component of the website, and sprinkled it in here-and-there where it made sense,
                    but I have tended to avoid it in most places.
                </p>
                <p>
                    Instead, I have demonstrated the use of context view grouping by creating dynamic
                    layouts using flexbox and CSS grid. This has allowed me to create more flexible
                    and responsive layouts that adjust based on the device size. I have used media
                    queries to adjust the layout based on the device size, and have created layouts
                    that are mobile-first. This approach has allowed me to create a website that is
                    fully responsive and supports mobile, tablet, and desktop devices. I encourage
                    you to check out the
                    <a target="_blank" href="https://matthewleigh.github.io/bandwidth/event/3">Psychedelic Jam</a>
                    event, which is a great example of a dynamic layout that adjusts based on the
                    device size.
                </p>

            </section>

            <!-- Modules -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Modules</span>
                </h2>
                <h3>
                    Demonstrate the use of modules - implement the web application with a number of
                    controllers and config. (Maybe even custom directives and filters - optional but
                    nice)
                </h3>
                <p>
                    This website was made with Vue 3, and takes advantage of modules in the form of its
                    <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/tree/main/frontend/src/components">23 Components</a>
                    and
                    <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/tree/main/frontend/src/views">10 Views</a>.
                    Each component and view is a module that encapsulates a specific piece of
                    functionality, such as a header, footer, event list, or event details. This
                    modular approach makes the codebase easier to manage and maintain, as each module
                    is self-contained and can be reused across different parts of the website.
                </p>
                <p>
                    Additionally, the website uses a number of controllers and config files to manage
                    the application state and configuration. The
                    <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/blob/main/frontend/src/stores/session.js">Session Store</a>
                    is used to manage the user's session and authentication state, while the
                    <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/blob/main/frontend/src/stores/useSelectedDatesStore.ts">Selected Dates Store</a>
                    retains the selected dates for the event filter when the user navigates between
                    different views.
                </p>

            </section>

            <!-- Arrays -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Arrays</span>
                </h2>
                <h3>Demonstrate the use of arrays</h3>
                <p>
                    Arrays are used throughout the website to store and manage data. I think anyway
                    website that can't demonstrate the use of arrays is going to be a pretty boring
                    website. One of the most prominent examples of the use of arrays on the website is
                    the <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/blob/main/frontend/src/components/FocusCardRow.vue">FocusCardRow Component</a>
                    which accepts an array of focus objects and displays them in a row.
                </p>

            </section>

            <!-- Prototyping and Design -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Prototyping and Design</span>
                </h2>
                <h3>
                    Demonstrate the mobile first design concept supporting mobile portrait, mobile
                    landscape and desktop
                </h3>
                <p>
                    I am not a designer, as evidenced by the fact that I made the prototypes for this
                    website in Canva. However, as a non-designer, I am very proud of the design of this
                    website. I think it is clean, modern, and easy to use. The
                    <a target="_blank" href="https://www.canva.com/design/DAGZTNcubuY/R9hzY4d9h-509wLeaN4RMA/edit?utm_content=DAGZTNcubuY&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton">Mobile Design Prototype</a>
                    and
                    <a target="_blank" href="https://www.canva.com/design/DAGZbU7cMz0/K4GXh9dyRNEHzH6VxZi8CA/edit?utm_content=DAGZbU7cMz0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton">Desktop Design Prototype</a>
                    can be seen at these links.
                </p>
            </section>

            <!-- Accessibility Support -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Accessibility Support</span>
                </h2>
                <h3>Demonstrate accessibility support more specifically on input forms and tables</h3>
                <p>
                    Accessibility support in forms helps to ensure that users with disabilities or
                    impairments are able to use the website with the help of assistive technologies.
                    This includes screen readers, magnifiers, and voice recognition software. The
                    website has been designed with accessibility in mind, and all input forms and
                    tables are usable and accessible. This includes the use of labels, placeholders,
                    and aria attributes to help users navigate the website using assistive technologies.
                </p>
                <p>
                    Below is a screenshot of the WAVE Web Accessibility Evaluation Tool showing the
                    accessibility of the
                    <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/blob/main/frontend/src/components/LoginForm.vue">Login Form</a>
                    on the website. The form has been designed with
                    accessibility in mind, and all input fields have labels, placeholders, and aria
                    attributes to help users navigate the form using assistive technologies.
                    Additionally, forms on the website are crated using Vuetify components, which
                    are designed to be accessible out of the box.
                </p>
                <img :src="require('../assets/login-form-wave-check.png')" alt="Login Form WAVE Check">
            </section>

            <!-- HTML 5 Coding Conventions -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>HTML 5 Coding Conventions</span>
                </h2>
                <h3>Demonstrate appropriate use HTML 5 coding conventions - case, indentation</h3>
                <p>
                    The website is built using Vue 3, which generates HTML 5 compliant code out of
                    the box. The HTML code is correctly indented, with meaningful names assigned to
                    all model identifiers. The code is commented to help the reader understand the
                    abstractions and how they work. Additionally, the JavaScript code adheres to JSLint
                    rules, which helps to ensure that the code is clean, readable, and maintainable.
                    Please check out any files in the
                    <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/tree/main/frontend">Frontend Repository</a>
                    to verify this.
                </p>
            </section>
        </article>

        <article>
            <DividerBar :text="'6.3 High Distinction Criteria'" class="divider-bar"/>

            <!-- Reasonable Complexity -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Reasonable Complexity</span>
                </h2>
                <h3>Ability to design and implement a web application of reasonable complexity.</h3>
                <ul>
                    <li>
                        Web application does more than have the user respond to random data (e.g.
                        number guessing game), or simply manipulate data (e.g. calculator, units and
                        units2).
                    </li>
                    <li>
                        The web application must demonstrate the need to think about its view
                        structure, model and module implementation.
                    </li>
                </ul>
                <p>
                    I would hope that this website pretty clearly demonstrates the ability to design
                    and implement a web application of reasonable complexity.
                </p>
                <p>
                    The website is a single page application that uses the Vue Router to navigate
                    between different views. The website supports filtering and searching for
                    events, venues, and artists. User's can create an account and login to save
                    their favourite events, venues, and artists, as well as comment on each of these.
                    Data is stored in a sqlite database and accessed via a REST API. The website is
                    fully responsive and supports mobile, tablet, and desktop devices. The website
                    is hosted on GitHub Pages, while the server and database are hosted on Render.
                    Advanced Vuetify components such as the v-calander and navigation drawer are
                    used to create a modern and engaging user experience. Finally, the website uses
                    a number of features not covered in this unit, such as state management and
                    TypeScript data models to manage the application state and data.
                </p>
                <p>
                    Please also see the reasonably complex
                    <a target="_blank" href="https://lucid.app/lucidchart/ef106a66-2b21-4603-b0e8-a0b71c9e5a8b/edit?invitationId=inv_84152621-20af-4d14-9ab8-9f0afbfa1df9&page=0_0#">Entity Relationship Diagram</a>
                    for the database schema.
                </p>
            </section>

            <!-- Effective Use of Decomposition -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Effective Use of Decomposition</span>
                </h2>
                <ul>
                    <li>
                        The web application consists of custom filter, custom directive, and config
                        with little code duplication.
                    </li>
                </ul>
                <p>
                    The website is built using Vue 3, which allows for the creation of custom filters,
                    directives, and config files. Most of the data used in the website is stored in
                    a SQLite database and accessed via a REST API. The website uses a number of custom
                    filters to format the data, such as the date filter in the event search view,
                    and the csv filter in the focus card component. Additionally, the website uses
                    custom directives to manage the application state, such as the v-focus directive
                    in the event search view. Finally, the website uses a number of config files to
                    manage the application configuration, such as the vuetify config file in the
                    main.js file.
                </p>
                <ul>
                    <li>
                        Data from external sources or data APIs is used intelligently to minimise
                        the amount of code required.
                    </li>
                </ul>
                <p>
                    This website is built to serve the Melbourne music scene, but I wanted to make
                    it accessible to people visiting Melbourne as well by letting them specify their
                    home Country and State in the
                    <a target="_blank" href="https://github.com/MatthewLeigh/bandwidth/blob/main/frontend/src/components/SignUpForm.vue">Sign Up Form</a>.
                    However, I didn't want to have to manually enter every country and state in the
                    world into the database. Instead, I used the
                    <a target="_blank" href="https://restcountries.com/">Rest Countries API</a>
                    to get a list of all countries and their states. This allowed me to minimise the
                    amount of code required to create the sign up form, and also made it easier to
                    maintain the website in the future.
                </p>
                <p>
                    Similarly, I used the
                    <a target="_blank" href="https://countriesnow.space">Countries Now</a> API
                    to get a list of all states for the selected country.
                </p>

            </section>

            <!-- Effective Use of Structure Design -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Effective Use of Structure Design</span>
                </h2>
                <ul>
                    <li>
                        HTML structure elements represent meaningful context grouping and row-column
                        system that supports at least three device sizes.
                    </li>
                    <li>
                        Input forms and tables are usable and accessible.
                    </li>
                </ul>
                <p>
                    Please see above sections where I have provided detailed justifications for each
                    of these criteria.
                </p>

            </section>

            <!-- User of Good Programming Practices -->
            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Use of Good Programming Practices</span>
                </h2>
                <ul>
                    <li>Code is correctly indented, with meaningful names assigned to all model identifiers</li>
                    <li>Code is commented to help the reader understand the abstractions and how they work.</li>
                    <li>HTML code is HTML 5 compliant, JavaScript code adhere to JSLint rules.</li>
                </ul>
                <p>
                    Again, please see above sections where I have provided detailed justifications for
                    each of these criteria.
                </p>
            </section>

        </article>

        <article>

            <DividerBar :text="'What\'s Next?'" class="divider-bar"/>

            <!-- Admin Site -->
            <section>
                <h2>
                    <v-icon icon="mdi-badminton" />
                    <span>Admin Site</span>
                </h2>
                <p>
                    The next stage of this project will be the development of a secondary admin
                    website where events, artists, and venues can be added, updated, and deleted. My
                    initial thoughts for this next stage was to develop web scrappers for each venue
                    and have them add data to a temporary repository for editing / approval on an
                    admin site, but research into similar sites has indicated that data cleaning can
                    be a very involved process for this type of data, and that a more manual process
                    might even prove more efficient.
                </p>
                <p>
                    Additionally, local venue sites are notoriously bad, and navigating each of them
                    to find the relevant information would be a very time consuming process. I am
                    currently considering the best way to get this admin site up and running.
                </p>
            </section>

            <!-- Security -->
            <section>
                <h2>
                    <v-icon icon="mdi-security" />
                    <span>Security</span>
                </h2>
                <p>
                    My APIs are currently open to the public, and I have not implemented any security
                    measures to protect the data. I don't use JWS tokens, hash my passwords, or attempt
                    to protect the data in any way. The next stage of this project will be to implement
                    security measures to protect the data and the users of the website. I ignored this
                    stage for the initial version of the website as I wanted to focus on the
                    functionality and design of the website in the limited time that I had, but I am
                    aware that this is a critical part of any website and will be a priority for the
                    next stage of this project.
                </p>
            </section>

            <!-- Improved Design -->
            <section>
                <h2>
                    <v-icon icon="mdi-pencil-ruler" />
                    <span>Improved Design</span>
                </h2>
                <p>
                    I am very proud of the design of this website. I think it is clean, modern, and
                    easy to use. However, I am also very aware that I am not an experienced designer,
                    and there is a lot that could be done to improve the design of the website. I
                    am taking on-campus classes at Swinburne this year and will be on the look out
                    for a design student who would like to collaborate on this project.
                </p>
            </section>

        </article>

        <!-- Random Banner -->
        <RandomBanner />

  </v-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue'
    import RandomBanner from '@/components/RandomBanner.vue';
    import DividerBar from '@/components/DividerBar.vue';

    export default defineComponent({
        name: 'AboutView',

        components: {
            RandomBanner,
            DividerBar
        }

    });
</script>

<style>

    article {
        margin-top: 48px;
    }

    .divider-bar {
        margin-bottom: 24px;
    }

    section {
        padding: 24px 12px;
        border-radius: 4px;
    }

    section:hover {
        background-color: var(--c-bg-subtle-highlight);
    }

    section .v-icon {
        margin-right: 12px;
        transform: translateY(-2px);
    }

    section h2 {
        font-size: 1rem;
        font-family: 'Poppins-SemiBold', sans-serif;
    }

    section h3 {
        font-size: 1rem;
        font-family: 'Poppins-Thin', sans-serif;
        margin-left: 36px;
    }

    section p,
    section img {
        margin: 12px 0 12px 36px;
    }

    section img {
        max-width: 100%;
    }

    ul {
        padding: 12px 0 12px 52px;
        font-size: 1rem;
        font-family: 'Poppins-Thin', sans-serif;
        font-weight: 700;
    }

</style>