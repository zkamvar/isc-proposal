Supporto the Quarto
================

Zhian N. Kamvar
2022-09-22

-   [NOTES](#notes)
-   [Signatories](#signatories)
    -   [Project team](#project-team)
    -   [Contributors](#contributors)
    -   [Consulted](#consulted)
-   [The Problem](#the-problem)
-   [The proposal](#the-proposal)
    -   [Overview](#overview)
    -   [Detail](#detail)
-   [Project plan](#project-plan)
    -   [Start-up phase](#start-up-phase)
    -   [Technical delivery](#technical-delivery)
    -   [Other aspects](#other-aspects)
-   [Requirements](#requirements)
    -   [People](#people)
    -   [Processes](#processes)
    -   [Tools & Tech](#tools--tech)
    -   [Funding](#funding)
    -   [Summary](#summary)
-   [Success](#success)
    -   [Definition of done](#definition-of-done)
    -   [Measuring success](#measuring-success)
    -   [Future work](#future-work)
    -   [Key risks](#key-risks)


## NOTES

These are notes from talking with Yanina about [my twitter thread](https://twitter.com/ZKamvar/status/1573363038669111298?s=20&t=fhQlFMOf1AuH2baVbjvsCQ)

lessons that are not in R can use this infrastructure <- this is a good pitch

The fact that The Carpentries has high impact for larger communities. 

Proposals like this have a good chance. 

Try to highlight a tool for people who want to create training materials with the carpentries philosophy

lesson will have evidence-based teaching practices. 

we are providing tools to make it easier. No expertise on GitHub Actions, Quarto, Yaml needed.

Highlight that The Carpentries materials are used in other places. 

> The primary purpose of the R Consortium (collectively, the “Purpose”) is to: 
>
>(a) advance the worldwide promotion of and support for the R open source
>language and environment as the preferred language for statistical computing
>and graphics (the “Environment”);
>
>(b) establish, maintain, seek support for, and develop infrastructure projects
>and technical and infrastructure collaboration initiatives related to the
>Environment, and such other initiatives as may be appropriate to support,
>enable and promote the Environment; 
>
>(c) encourage and increase user adoption, involvement with, and contribution
>to, the Environment; 
>
>(d) facilitate communication and collaboration among users and developers of
>the Environment, the R Consortium and the R Foundation for Statistical
>Computing (the “R Foundation”); 
>
>(e) support and maintain policies set by the Board; and 
>
>(f) undertake such other activities as may from time to time be appropriate to
>further the purposes and achieve the goals set forth above.  
>
>In furtherance of these efforts, the R Consortium shall seek to solicit the
>participation of all interested parties on a fair, equitable and open basis.
>*[R Consortium Bylaws, Section 1.4](https://bylaws.r-consortium.org)*


## Signatories

<!-- 
This section provides the ISC with a view of the support received from the community for a proposal. Acceptance isn't predicated on popularity but community acceptance is important.  Willingness to accept outside input is also a good marker for project delivery. 

An optional section would be for R-Core signatories where changes to R are proposed.
-->

### Project team

<!-- 
Who are the people responsible for actually delivering the project if the proposal gets accepted and are already signed up and rearing to go?
-->
Zhian N. Kamvar - Lead Developer
Toby Hodges - Community Advocate
Kari L. Jordan - Supervisor


### Contributors

<!-- 
Who are the people who have actively helped with this proposal but won't necessarily be on the core project team later?
-->

### Consulted

<!-- 
Who has been given the opportunity to provide feedback on the proposal? This should include any R Consortium & ISC members who the proposal has been discussed with.
-->

Yanina Bellini Saibene

## The Problem

<!-- 
Outlining the issue / weak point / problem to be solved by this proposal. This should be a compelling section that sets the reader up for the next section - the proposed solution!

It is important to cover:

 - [ ] What the problem is
 - [ ] Who it affects
 - [ ] Have there been previous attempts to resolve the problem
 - [ ] Why it should be tackled
-->

### Problem Statement

Of all languages, R is the most versatile when it comes to literate programming and the ability to rapidly publish results thanks to the advent of R Markdown.
More importantly, unlike JSON-based formats like Jupyter notebooks, R Markdown enables **reproducible collaboration** under version control.
Literate programming also enables the creation of maintainable and reproducible teaching materials.
To host such materials, however, requires not only expertise in a domain area, it also requires knowledge of continuous deployment systems, reproducible workflows, and UI elements for the Web.
Designed with our Core Values in mind, The Carpentries lesson infrastructure provides templating, guidance, and tools that allows rapid development and publishing of high-quality lesson content.
The lesson contributor only needs to focus on the writing the content of the lesson in Markdown or R Markdown.
With this infrastructure, we champion community collaboration and access for all.

The infrstructure---called "The Carpentries" workbench---is a "batteries-included" setup for building lessons that allows anyone to take new or pre-existing Markdown or R Markdown lesson materials and create a lesson.
The Carpentries Workbench uses {knitr} to render R Markdown documents to Markdown followed by pandoc and {pkgdown} to render Markdown to HTML.
For lessons that teach R, authoring R Markdown with a seamless integration with {renv} ensures that lessons are reproducible by default.
Moreover, integration with GitHub Actions means that pull request previews can show lesson maintainers exactly where output in a lesson has changed from new contributions or package updates.

Lessons that do not teach R, however, must use plain Markdown where the output of demonstrative and excercise code is copy and pasted into lessons.
Copy and pasting outputs is inherently non-reproducible and makes non-R lessons difficult to maintain as the software ecosystem changes and evolves.
Ultimately, these extra steps are significant burdens in a volunteer framework.
These burdens not only result in lost contributions to existing lessons, but also lessons that were never developed.

There have been attempts in The Carpentries community to create work-arounds to this problem.
Some lesson authors who work with Python have created a separate folder of Jupyter notebooks and render them to markdown (such as [Intro to MRI Data in Python](https://github.com/carpentries-incubator/SDC-BIDS-IntroMRI/tree/3d9d687a7c49c6af761a9170ed7ea60f16fcc0d2)), which is then used as the input for the lesson.
This allows them to work in a framework that is comfortable for them, but it hampers collaboration because people who want to contribute may attempt to contribute to the markdown output, when they should be contributing to the notebooks.

Others, such as [the Learn To Discover group](https://github.com/LearnToDiscover/Basic_Python) have used {reticulate} in The Carpentries Workbench to provide interoperability between R and Python. This gives the advantage that contributors are able to contribute to the lesson, but the format is not familiar or clear.

In both cases, the lesson authors needed knowledge of continuous deployment, reproducible workflows, and of the underlying framework to accomplish their goals.

We want our lesson infrastructure to live up to our values of people first, access for all, community collaboration, and strength through diversity. 
We propose to eliminate the extra burdens required to contribute to non-R lessons and create opportunities to create cross-language lessons by integrating Quarto into The Carpentries Workbench.
Released in July 2022, Quarto is a framework based the same principles as R Markdown that allows anyone to write their analysis in their preferred programming language and easily publish their results in a reproducible manner.

We have lowered the barrier for others to access our evidence-based approach to lesson design and deployment.
Because the Carpentries Materials are always open-source, may organisations have used and remixed our infrastructure for their own purposes.
By incorporating Quarto, we will be able increase the quality of non-R lessons and help strengthen the bridge between languages to enable lessons in other languages and eventually polyglot lessons.
This will in turn help train future generations of researchers to work reproducibly.

## The proposal

<!--
This is where the proposal should be outlined. 
-->

### Overview

<!--
At a high-level address what your proposal is and how it will address the problem identified. Highlight any benefits to the R Community that follow from solving the problem. This should be your most compelling section.
-->

We will enable support for reproducible publishing of non-R languages in The Carpentries Lesson Infrastructure by integrating the Quarto publishing engine into The Carpentries Workbench.
The Carpentries Workbench is an opinionated lesson publication system as a set of R packages that prioritises accessibility and sensible defaults to produce Carpentries-styled lessons.
With a modular foundation, The Carpentries Workbench uses a two-step workflow that first renders R Markdown to markdown via {knitr} followed by a step that uses Pandoc to render markdown to HTML templating.
Because this is a similar model used by Quarto, we propose to replace the underlying engines from {knitr} + Pandoc to Quarto in our modular foundation without affecting the superstructure.


Our goal is to eliminate the barriers to contribution of lesson materials by increasing the number of lanugages available.
Moreover, quarto will enable development of lessons demonstrating Python to R, Julia to R, or any other multi-lingual workflow.
These multi-lingual lessons can demonstrate R's strengths in the context of another language and help promote R to people who would not have previously encountered R.

By reducing barriers to contribution, more people will be empowered to create educational materials _based on The Carpentries philosophy_.
These new educational materials will help to usher in a new generation of data scientists and researchers from more diverse backgrounds who will have the confidence and ability to use reproducible research practices to solve future problems. 

### Detail

<!--
Go into more detail about the specifics of the project and it delivers against the problem.

Depending on project type the detail section should include:

 - [x] Minimum Viable Product
 - [x] Architecture
 - [ ] Assumptions
-->

### Minimum Viable Product

The minimum viable product of this project will be:

Support for `*.qmd` and files in The Carpentries Workbench

: The Carpentries Workbench should treat any `*.qmd` files as valid input documents by default. Note that `*.ipynb` documents should first be converted to `*.qmd`.

Quarto template for Carpentries-style lessons

: This template will allow folks who want to create lessons without the workbench to take advantage of the styling.

Documentation for non-R lessons

: A Tutorial, How-to guide, Reference, and Explanation documents will help make clear the features and limitations of the quarto integration

Blog Post

: A blog post that summarises the feedback from our community members who maintain lessons in Python, BASH, and SQL.

Unit, Integration, and Regression tests for Python, SQL, and BASH

: These languages are the most common taught in our ecosystem and should have robust tests

Non-invasive integration with Pyenv

: Pyenv is the most common mechanism for defining requirements for a python project. We want to embed this to enable the same approach to reproducibility that we have for R lessons.

Quarto itself will be implemented in the [{sandpaper}] package and the template will be implemented in [{varnish}]. 
The tutorial, how-to guide, and explanation documents will be implemented with The Carpentries Workbench template while the reference documents will be implemented in {pkgdown} for [{sandpaper}].

We are assuming here that The Workbench will have wide acceptance 

[{sandpaper}]: https://carpentries.github.io/sandpaper
[{varnish}]: https://carpentries.github.io/varnish


## Project plan

### Start-up phase

<!--
Covering the planning phase, this section should provide a relatively detailed plan of how work will start on the project. This section is important because projects need to get up and running quickly.


 - [ ] Setting up collaboration platform inc. code for contributors etc.
 - [ ] Licence decisions
 - [ ] Reporting framework
-->

The startup phase will be relatively light as the components for these features will live inside of established packages. 
Licenses for this work will be MIT. 
The reporting will be done publicly via bi-monthly blog post updates to The Carpentries Blog series ["The Dovetail"](https://carpentries.org/posts-by-tags/#blog-tag-dovetail).

### Technical delivery

<!--
Covering the actual delivery of the project this section should provide at least a high-level the implementation. 

Including target dates is really important as you need to be committed and the ISC need to have a means of tracking delivery
-->

We have identified several steps to achieve our goals in roughly six months:

- Week 1: Use tutorial-driven development to first document the typical workflow for a lessonthat does not use R. (1 week)
- Weeks 2-3: Replace {knitr} with {quarto} inside of `sandpaper:::render_html()` to achieve polyglot capabilities. (2 weeks)
- Weeks 4-6: Harness pyenv to create non-invasive versioning system for python documents (3 weeks)
- Weeks 5-9: Alpha testing of local workflows with user environments with various levels of expertise and development of remote workflows.
- Weeks 10-11: Create lua filters to replace XPath manipulation currently in {sandpaper} (2 weeks)
- Week 12: create pandoc templates (1 week)
- Week 13: update varnish and `sandpaper:::build_html()` to use quarto pandoc templates <!-- Extremely Milton Dammers as portrayed by Jeffrey Combs in the 1996 thriller "The Frighteners" voice: The number 13... Unlucky for some -->
- Week 14-17: Test conversion on lesson infrastructure
- Week 18: Release updated workbench and varnish as a quarto theme (1 week)
- Week 19-24: remove outputs from python lessons, convert to quarto, validate, and release lessons.


### Other aspects

<!--
Covering non-technical activities like on-going publicity, paper preparation, discussion groups etc. that might be required to facilitate successful delivery of the project.

 - [ ] Announcement post
 - [ ] Delivery blog post
 - [ ] Twitter
 - [ ] UseR!
 - [ ] ISC meetings
-->

As The Carpentries is a global community, we will continue to keep the community abreast of the updates happening with this project by using the communication channels available to us.
This includes posting updates in the bi-monthly Dovetail blog post series, Carpentries Clippings, and hosting quarterly community discussions. 
Beyond The Carpentries community, we will be posting things we learn along the way to the rOpenSci development corner [^pkg].
We aim to present the results of this work at the UseR!, SciPy, RSE, and Open Education conferences in 2023.


[^pkg]: An example from 2022-09: <https://ropensci.org/blog/2022/09/23/ropensci-news-digest-september-2022/#package-development-corner>

## Requirements

<!-- 
An idea of what is required to make the project actually happen
-->

### People

<!--
Who needs to be involved, what's the proposed structure, what will it take to get their involvement?
-->


The Carpentries is a global community of 3,000+ trained volunteer instructors, who have taught workshops that have reached 85,000+ learners. 
Our workshops teach introductory computing and data analytical skills to researchers. 
R is taught in more than half of our workshops. 
All the lessons materials are available for free, under a Creative Commons Attribution License, and have been developed by hundreds of contributors. 

Zhian N. Kamvar is the Lesson Infrastructure Developer for The Carpentries and an experienced R developer with 8 authored packages on CRAN spanning reproducible research, population genetics, and epidemiology.
He is responsible for designing and creating The Carpentries Workbench.
He will lead the integration effort, blog post construction, as well as submission to conference proceedings.

Toby Hodges is the Curriculum Team lead for The Carpentries and is an experienced community manager, having maintained community submissions to The Carpentries Incubator since 2020.
He has designed and taught workshops that introduce The Workbench to audiences who are both experienced and new to The Carpentries.
He will be responsible for developing high-level tutorials and setup documents for the new version of The Workbench that uses Quarto.

Kari L. Jordan is the Executive Director for The Carpentries. 
She has been involved with The Carpentries since 2016 and has been responsible for directing and coordinating the execution of our strategic plan since 2020.
She is the direct supervisor of Zhian N. Kamvar and will provide oversight of the project.

### Processes

<!-- 
What processes need to be put in place e.g. codes of conduct, regular ISC meetings, handover to the community at large?
-->

### Tools & Tech

<!--
What is going to be needed to deliver this project? 

Will cloud computing be used - if yes are there are necessary components that will be deciding factors between providers?

Are there tools or tech that don't exist that will be produced to facilitate the project?
-->

All tools and technology are publicly and freely available for the project.
Primary development is to take place on Zhian N. Kamvar's work computer, continuous integration on MacOS, Windows, and Ubuntu platforms will take place on GitHub actions.
Provisioning and generation of components needed for dynamic lesson content will take place on GitHub actions.
Blog posts will be hosted on The Carpentries website, hosted by AWS.

### Funding

<!-- 
[TO DO] THE GUIDANCE IS PRETTY UNCLEAR, ESP IN LIGHT OF GABOR'S PROPOSAL VS AWARD SIZE

-->

Funding for this project will go to support Zhian N. Kamvar and Toby Hodges' time to develop the infrastructure and documentation.

## Success

<!-- 
Projects should have a definition of done that is measurable, and a thorough understanding going in of what the risks are to delivery 
-->
Success for this project will happen when we have our Python lessons dynamically generate plots and output.
Reaching this stage means that we have not only successfully implemented quarto into the workbench, but also have 


### Definition of done

<!-- 
What does success look like? 
-->

This project will be successful when:

1. we are able to port our existing official lessons that use Python to use dynamic generation of plots and output in their lessons.
2. we have four levels of documentation: tutorial, how-to, discussion, and reference
3. at least one maintainer from each python lesson is able to build the lesson locally

**ZNK: I am confused by the difference between "Measuring Success" and "Definition of Done". These both seem to be extremely similar :/**

### Measuring success

<!-- 
How will we know when success is achieved, what markers can we use along the way 
-->

### Future work

<!-- 
How could this be extended / developed in the future by yourself and/or the community in general?
-->

Future work for this would be to examine the dependency provisioning structure for the workbench and generalising it for more languages.
Moreover, ports of The Workbench to other languages can help lesson developers who simply do not wish to use R as an interface.

### Key risks

<!-- 
What sort of things could come up that can delay or break the project?

 - [ ] People
 - [ ] Processes
 - [ ] Tooling & Technology
 - [ ] Costs

-->

Some key risks that could delay the project would be:

 - Significant changes to the pricing model or ethical standing of GitHub Actions, which The Carpentries uses heavily to dynamically deploy lessons. 
   This is mitigated by ensuring that core deployment mechanisms in the R packages are agnostic to higher-level frameworks so that we can pivot to a different deploy system if needed.
 - Lack of uptake by communities outside The Carpentries.
   We will mitigate this by publicising our work early on and soliciting feedback from early adopters.
 - Staffing shortages due to unanticipated circumstances (COVID, natural disaster, etc). <!-- ZNK: yes, I know this is Too Dark Park, but I _think_ it should be addressed -->
   Addressing this will be taken via training core team and community members on how The Workbench works.


