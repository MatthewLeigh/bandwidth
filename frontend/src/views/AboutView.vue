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
                    <v-icon icon="mdi-account" />
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
                <ul>
                    <li><a class="clickable" target="_blank" href="https://lucid.app/lucidchart/ef106a66-2b21-4603-b0e8-a0b71c9e5a8b/edit?invitationId=inv_84152621-20af-4d14-9ab8-9f0afbfa1df9&page=0_0#">ERD</a></li>
                    <li><a class="clickable" target="_blank" href="https://www.canva.com/design/DAGZTNcubuY/R9hzY4d9h-509wLeaN4RMA/edit?utm_content=DAGZTNcubuY&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton">Mobile Design Prototype</a></li>
                    <li><a class="clickable" target="_blank" href="https://www.canva.com/design/DAGZbU7cMz0/K4GXh9dyRNEHzH6VxZi8CA/edit?utm_content=DAGZbU7cMz0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton ">Desktop Design Prototype</a></li>
                </ul>
            </section>
        </article>




        <article>

            <DividerBar :text="'6.2 Distinction Criteria'" class="divider-bar"/>

            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Context View Grouping</span>
                </h2>
                <h3>Demonstrate the use of context view grouping - implement the web application with a structure of row-column grid system.</h3>

            </section>

            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Modules</span>
                </h2>
                <h3>Demonstrate the use of modules - implement the web application with a number of controllers and config. (Maybe even custom directives and filters - optional but nice)</h3>

            </section>

            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Arrays</span>
                </h2>
                <h3>Demonstrate the use of arrays</h3>

            </section>

            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Prototyping and Design</span>
                </h2>
                <h3>Demonstrate the mobile first design concept supporting mobile portrait, mobile landscape and desktop</h3>

            </section>

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

            </section>

            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>HTML 5 Coding Conventions</span>
                </h2>
                <h3>Demonstrate appropriate use HTML 5 coding conventions - case, indentation</h3>

            </section>
        </article>

        <article>
            <DividerBar :text="'6.3 High Distinction Criteria'" class="divider-bar"/>

            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Reasonable Complexity</span>
                </h2>
                <h3>Ability to design and implement a web application of reasonable complexity.</h3>
                <ul>
                    <li>Web application does more than have the user respond to random data (e.g. number guessing game), or simply manipulate data (e.g. calculator, units and units2).</li>
                    <li>The web application must demonstrate the need to think about its view structure, model and module implementation.</li>
                </ul>
            </section>

            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Effective Use of Decomposition</span>
                </h2>
                <ul>
                    <li>The web application consists of custom filter, custom directive, and config with little code duplication.</li>
                    <li>Data from external sources or data APIs is used intelligently to minimise the amount of code required.</li>
                </ul>

            </section>

            <section>
                <h2>
                    <v-icon icon="mdi-check" />
                    <span>Effective Use of Structure Design</span>
                </h2>
                <ul>
                    <li>HTML structure elements represent meaningful context grouping and row-column system that supports at least three device sizes.</li>
                    <li>Input forms and tables are usable and accessible.</li>
                </ul>

            </section>

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

            </section>

        </article>

        <article>

            <DividerBar :text="'What\'s Next?'" class="divider-bar"/>

            <section>
                <h2>
                    <v-icon icon="mdi-badminton" />
                    <span>Admin Site</span>
                </h2>
                <p>
                    The next stage of this project will be the development of a secondary admin
                    website where events, artists, and venues can be added, updated, and deleted. My
                    initial thoughts for this next stage was to develop web scrappers for each venue
                    listed that could update the database directly, but research into similar sites
                    has indicated that data cleaning can be a very involved process for this type of
                    data.
                </p>
            </section>

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
        cursor: pointer;
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

    section p {
        margin: 12px 0 12px 36px;
    }

    ul {
        padding: 12px 0 12px 52px;
        font-size: 1rem;
        font-family: 'Poppins-Thin', sans-serif;
        font-weight: 700;
    }

</style>