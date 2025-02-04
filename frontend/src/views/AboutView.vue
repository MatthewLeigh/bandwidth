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
                    Development.
                </p>
                <p>
                    The website is a Vue 3 application that uses the Vuetify Material Design
                    Framework. The website is hosted on GitHub Pages and the source code is
                    available on GitHub.
                </p>
            </div>
        </div>

        <article>

            <DividerBar :text="'Lorem Ipsum'" class="divider-bar"/>

            <section>
                <h2>
                    <v-icon icon="mdi-account" />
                    <span>Introduction</span>
                </h2>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi dolorem aliquam
                    commodi sint minus modi sed necessitatibus, dolores ut quidem recusandae corporis
                    suscipit earum nostrum, ducimus similique qui, ullam nemo.
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