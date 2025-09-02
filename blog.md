# Building a FHIR Implementation Guide with AI: My T1D Exchange Journey

## Before we start ...

This document describes an interesting 'side project' I took on recently where I wanted to do two things:
- Deepen my understanding of how an AI agent could help me in my day-to-day work.
- Develop a FHIR Implementation Guide in an area with a non-standards based health care data specification.

I am writing this section myself, but the rest of this document and nearly all the content for the IG was created by me chatting with [Amazon Q Developer](https://aws.amazon.com/q/developer/) using Claude Sonnet 4 LLM via a VSCode plugin. This was me working on this off and on for a few weeks - I would estimate maybe 12-16 hours of my time. 

With that caveat, off we go ...

## How It All Started

A few weeks ago, I had what seemed like a straightforward task: create a FHIR Implementation Guide for the T1D Exchange Data Specification. I had Excel files full of data specifications and a goal to transform them into a working FHIR IG that could support quality improvement and research for Type 1 Diabetes care.

What I didn't expect was how this would turn into one of the most interesting collaborations I've had with AI - and how quickly we could go from concept to a comprehensive, working Implementation Guide.

## The Initial Challenge

Let me be honest - while I'm very familiar with FHIR and Implementation Guide development, I had only a shallow understanding of T1D care and quality improvement. I had these Excel specifications full of clinical concepts, quality metrics, and data elements that I didn't fully understand, but I knew I needed to transform them into a working FHIR IG.

So I started a conversation with Amazon Q with the basic request: help me understand these T1D care specifications and transform them into a working FHIR IG.

But first, I knew I needed to create a clear set of requirements. I wrote a CONTEXT.md file that outlined the project goals, key stakeholders, and initial requirements based on what I understood from the Excel specifications. This became our north star - a reference point that Q could use to understand the bigger picture and make decisions that aligned with the project's objectives. As we learned more about T1D care and refined our approach, this context file evolved too, becoming more detailed and nuanced. Having that initial requirements document was crucial for getting started on the right path.

I have to say, the first version of the IG that Q created was remarkably good - it gave us a solid foundation to iterate from. That's the power of starting with clear requirements and letting AI handle the systematic implementation.

## Early Decisions That Made All the Difference

Initially, I wanted to build our profiles on US Core - it seemed like the "right" thing to do for a US-focused IG. So Q started implementing T1D profiles that inherited from US Core Patient, US Core Practitioner, and so on.

But then we started hitting issues. Complex slicing conflicts, dependency management problems, and build errors that were hard to resolve. After wrestling with several of these issues, I made the strategic decision to drop the US Core dependency and build on base FHIR R4 instead.

This turned out to be one of our best decisions. Suddenly, the profiles were cleaner, the builds were more reliable, and we could focus on the T1D-specific requirements without fighting US Core constraints. Sometimes the pragmatic choice is the right choice.

## The Magic of Iterative Development

What struck me most was how we could iterate so quickly. I'd give feedback about documentation being too long or hard to follow, and within minutes, Q would propose breaking it into focused sections and show me exactly how to reorganize it.

Or I'd mention the need to align with existing CGM data standards, and Q would research the HL7 CGM Implementation Guide, analyze it, and come back with specific recommendations for bundle patterns that would work with existing standards.

The speed of iteration was incredible - we could go through multiple design cycles in a single conversation.

One area where this really shone was dealing with QA errors and warnings. FHIR IG builds produce some fascinating and sometimes cryptic error messages - everything from terminology validation failures to profile constraint violations. Initially, I'd copy and paste specific error messages for Q to help resolve. But as we got into a rhythm, I started asking Q to review the QA file and propose comprehensive fixes. Q would systematically work through the entire QA report, identify patterns in the errors, and propose solutions for whole categories of issues at once. This was incredibly efficient - instead of playing whack-a-mole with individual errors, we could address whole categories of issues at once.

But there was a challenge with this rapid iteration approach: content duplication and misalignment. As I requested new features or content, Q would implement them efficiently, but neither of us always caught when similar content already existed elsewhere in the IG. I found myself periodically asking Q to review all pages for duplicate content, and Q did an excellent job of identifying overlaps and proposing both content consolidation and better organizational structures. This taught me that with AI collaboration, you need to occasionally step back and look at the big picture to maintain coherence.

## Learning from Others (The CGM IG Breakthrough)

One of the turning points came when I asked Q to review the HL7 CGM Implementation Guide - I knew it existed and thought we could learn from their approach to diabetes-related data exchange. Q came back with a detailed analysis of their bundle-based approach and comparison with our needs.

Q suggested adapting their bundle patterns for comprehensive T1D data exchange after completing the analysis.

This led to one of our biggest architectural decisions - creating three different bundle types:
- T1DDataSubmissionBundle for comprehensive data submission
- T1DPatientDataBundle for patient-centric data extraction
- T1DQualityReportBundle for population health reporting

Suddenly, we weren't just creating profiles - we were building a complete data exchange framework.

## The Must Support Evolution

Initially, Q was applying Must Support flags pretty broadly. I provided feedback that this seemed excessive and we should focus on what's truly essential for T1D Exchange.

Q refined the approach to focus Must Support on:
1. Elements that mapped directly to our T1D Exchange specifications
2. Elements that used our custom T1D terminologies
3. Elements that referenced other T1D profiles

This made the IG much more implementer-friendly. Instead of everything being "must support," implementers could clearly see what was truly required for T1D Exchange compliance.

## Profile Enhancement: From Basic to Specification-Rich

One of our most significant iterations came when I realized we could do more than just map data elements - we could integrate the rich contextual information from the T1D Exchange specifications directly into the FHIR profiles.

I suggested enhancing the profiles with the detailed definitions, priority levels, and implementation notes from the Excel specifications.

Q systematically extracted over 380 variables from the specification files and mapped them to FHIR profile elements, adding:
- Full definitions from the specification's "Definition" column to element.definition
- Concise 5-10 word summaries to element.short
- Priority levels and implementation notes to element.comment

Suddenly, our profiles weren't just structural constraints - they were comprehensive implementation guides that included all the contextual knowledge from the original T1D Exchange specifications. Implementers could now see not just what elements to include, but why they mattered, how to calculate them, and what priority level the T1D Exchange assigned to each element.

This transformation took our IG from a basic FHIR mapping to a specification-rich implementation resource that preserved all the domain expertise from the original Excel files.

## Beyond Standards: Writing Code When Needed

One aspect that surprised me was how Q seamlessly shifted between different types of work as the project demanded. While our primary focus was FHIR IG development, Q would write software when needed to solve specific problems.

When I needed to extract detailed specification data from the Excel files, Q created a Python script (`extract_profile_data.py`) that could parse multiple Excel sheets, extract variable definitions, priorities, and notes, and output structured JSON data. This wasn't just basic file reading - Q handled complex Excel structures, data cleaning, and formatted the output specifically for our FHIR profile enhancement needs.

The script processed over 380 variables across 10 different specification sheets, extracting exactly the data we needed in the format we could use. Q wrote, tested, and refined the code in real-time as part of our conversation about enhancing the profiles.

This highlighted something important about AI collaboration: you're not just working with a domain expert or a technical writer - you're working with a partner that can shift between different types of technical work as the project requires. Standards development, documentation writing, data extraction, build troubleshooting - all seamlessly integrated into a single collaborative workflow.

## Making It Available: Automated Publishing

When it came time to make the IG available for review, Q helped set up the infrastructure for continuous publication. I mentioned wanting to publish the IG automatically whenever we made changes, and Q created a GitHub Action workflow that would build and publish the Implementation Guide to GitHub Pages on every push to the repository.

The workflow handles the complete build process - running SUSHI to generate FHIR artifacts, executing the HL7 FHIR IG Publisher, and deploying the results to GitHub Pages. This means that every time we make improvements or fixes, the published IG is automatically updated within minutes.

This automation was crucial for making the IG accessible to reviewers and stakeholders without manual deployment steps. It's another example of how Q could handle the DevOps aspects of the project alongside the standards development work.

## Documentation Challenges

As our IG grew, the documentation became unwieldy. I pointed out that the guidance page was becoming difficult to follow and navigate.

Q proposed breaking it into focused pages:
- Overview of Implementation
- Technical Implementation
- Quality Metrics
- Implementation Workflows
- Bundle Patterns
- Security & Best Practices

Each page would focus on a specific aspect, with cross-references between them. The result was much more navigable and user-friendly.

## Technical Problem-Solving

We hit various technical snags along the way - build errors, terminology validation issues, profile conflicts. What impressed me was Q's systematic approach to troubleshooting.

When we had dependency conflicts with US Core, I made the decision to remove it entirely. When we later hit issues with SDC dependencies, Q suggested removing those as well. When terminology validation failed, Q proposed simplifying our custom code systems. Each solution was pragmatic and focused on getting things working.

One particularly challenging issue came during the profile enhancement phase - we had extension slicing conflicts and display name mismatches when integrating the specification data. Q systematically worked through the QA errors, fixing extension conflicts by creating separate extension definitions and correcting terminology display names to match official HL7 standards. The result was a clean build with 0 errors and 0 warnings.

My guidance was usually simple: fix what's broken, but don't over-engineer it. Q consistently found the right balance between standards compliance and practical implementation.

## The Human-AI Sweet Spot

Looking back, I think we found a really effective collaboration pattern:

**What I brought:**
- Deep FHIR technical knowledge and IG development experience
- Strategic direction ("This is getting too complex" or "We need to focus on implementer needs")
- Real-world perspective on what would actually work in healthcare settings
- Quality judgment on when something was "good enough"

**What Q brought:**
- Ability to interpret and understand the T1D clinical domain from specifications
- Research capabilities to understand T1D care patterns and quality metrics
- Systematic execution across all profiles and documentation
- Domain translation - turning clinical concepts into FHIR structures
- Data extraction and mapping capabilities - processing 380+ specification variables systematically
- Pattern recognition for identifying and resolving build errors across multiple files
- On-demand software development - writing Python scripts to extract and process Excel data as needed
- DevOps automation - setting up GitHub Actions for continuous IG publication

Neither of us could have created this IG alone in the same timeframe. I didn't have the T1D domain knowledge or the time to write data extraction scripts, and Q didn't have the FHIR implementation experience and strategic judgment.

## Surprising Outcomes

What started as "help me map Excel to FHIR" became a comprehensive Implementation Guide with:
- 15 core profiles with detailed specification-based constraints
- 11 extensions for T1D-specific data elements
- 3 bundle profiles for different exchange patterns
- 2 operations for data submission and extraction
- 28 custom value sets and 2 code systems
- Complete examples for every profile with specification integration
- 7 focused documentation pages with comprehensive guidance

But more importantly, we created something that actually solves real problems for T1D care coordination, quality improvement, and research.

## Lessons Learned

**Start simple and iterate:** We began with basic profiles and added complexity based on need. This kept us from over-engineering early on.

**Research existing solutions:** The CGM IG research was a game-changer. Why reinvent when you can adapt proven patterns?

**Keep the human in the loop:** Strategic decisions and quality judgment were crucial. AI is incredibly capable, but human oversight on priorities and trade-offs was essential.

**Focus on implementer needs:** Every decision came back to "Will this help or hurt implementers?" This kept us grounded in practical reality.

## What This Means for Healthcare Standards

I think this project points to a new model for healthcare standards development. We could have domain experts collaborating with AI to rapidly prototype and iterate on standards, dramatically speeding up the development phase. But let's be clear - this doesn't replace the rigorous review, approval, and testing processes that Standards Development Organizations (SDOs) like HL7 have in place. Standards need to be adopted by large numbers of systems to be truly effective, and that still requires multiple levels of expert review, balloting, implementation testing, and refinement. However, AI agents are proving they have a real place in making this overall process more streamlined and efficient.

The key insight? Maintain human strategic oversight while leveraging AI's ability to execute technical implementation consistently and quickly.

## Looking Forward

The T1D Exchange FHIR IG is now ready for expert review and feedback - the next crucial step before any real-world implementation. You can review the complete Implementation Guide and source code at:

- **Published IG**: https://sirkyp.github.io/fhir-t1d-exchange/
- **GitHub Repository**: https://github.com/sirkyp/fhir-t1d-exchange

But more importantly, I think we've demonstrated a new way of approaching healthcare interoperability standards development.

This isn't about AI replacing human expertise - it's about amplifying it. FHIR experts can focus on architecture, strategy, and quality judgment while AI handles domain interpretation and systematic implementation.

I'm excited to see where this kind of collaboration takes us next. Healthcare interoperability has always been challenging, but maybe we've found a way to make it a little bit easier and a lot faster.

## Final Thoughts

Building this FHIR IG with AI assistance was one of the most productive technical collaborations I've experienced. We went from Excel specifications to a comprehensive FHIR framework in a matter of days, not months.

But the real win wasn't just speed - it was the quality of the collaboration. Having an AI partner that could research, implement, and iterate quickly while I focused on strategic direction and quality judgment felt like a glimpse into the future of technical work.

If you're working on healthcare standards or FHIR implementations, I'd encourage you to explore this kind of human-AI collaboration. I know Q and I are not the first AI and human combo to work on standards, but my experience shows me this is yet another place where AI can provide a great lift in productivity. The results might surprise you.