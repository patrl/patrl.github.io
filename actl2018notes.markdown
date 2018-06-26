---
title: Introduction to Dynamic Semantics
subtitle: Lecture 1
author: Patrick D. Elliott
date: 25.06.2018
...

$$
\newcommand{\eval}[2][]{{\left[\!\!\left[\text{#2}\right]\!\!\right]^{#1}}}
\newcommand{\evalM}[2][]{{\left[\!\!\left[ #2 \right]\!\!\right]^{#1}}}
\newcommand{\Set}[1]{\left\lbrace #1 \right\rbrace}
\newcommand{\lam}[1]{{\lambda #1\,.\,}}
\newcommand{\type}[1]{{\mathtt{#1}}}
\newcommand{\metalang}[1]{{\textbf{#1}}}
\newcommand{\entity}[1]{{\texttt{#1}}}
$$

# Lecture 1: The Formal Semanticist's Toolkit

## Slides

- pdf: <https://patrl.keybase.pub/actl2018/slides.pdf>
- html (support here still sketchy!): <https://patrickdelliott.com/actl2018notes.html> 

## Roadmap

- An overview of what semanticists are interested in.

- A lightning-fast overview of some basic formal machinery: sets, functions, and lambdas.

- Constructing our first formal language L~1~.

- *First Order Logic* (FOL)

- Next week: *Dynamic Predicate Logic* (DPL)

## Formal semantics

 - This class is going to provide you with an introduction to *formal
   semantics*.
   
 - What formal semantics is *not*:
   - A theory of the connotations and cultural associations of particular words and phrases. 
   - A theory of how we communicate through language.
   - A theory of concepts, and how we acquire them.
   
 - Rather formal semantics is typically concerned with the *logical* (i.e.
   *formal*) properties of language. Arguably, a theory of formal semantics
   should inform all of the above.
   
## Formal semantics ii
   
 - But...why isn't this class called *Introduction to Formal Semantics*?
 
 - The particular perspective we're going to work towards is that of *dynamic
   semantics*, a family of theories developed in the eighties and nineties by
   Irene Heim, Hans Kamp, Jeroen Groenendijk, Martin Stokhof, Paul Dekker, and others.
   
## Dynamic Semantics

 - Dynamic semantics is an approach to formal semantics which provides a unified
   perspective on anaphora, quantification, and the flow of discourse.
   
 - In the first part of the class, we're going to work towards an analysis of
   *donkey anaphora*, illustrated by the famous example sentence in (@donkey),
   using Groenendijk and Stokhof's theory *Dynamic Predicate Logic*.
   
   (@donkey) every farmer who owns a donkey$^x$ hits it$_x$
   
## Dynamic semantics ii

 - In most introductory classes, what is taught is a strictly *static*
   semantics, where the unit of analysis is strictly the *sentence*.
   
 - One of the key insights of dynamic semantics is that, not just sentences, but
   *discourses* can be assigned truth-conditions.
   
   (@disc) A man$^x$ walked in the room. He$_x$ sat down.
   
 - (@disc) is true iff there is a man $x$, s.t. $x$ walked in the room and $x$.
 
## Dynamic semantics iii

- One thing we're going to be thinking through is the relationship between a
  static semantics a dynamic semantics.
  
- In today's class, we're going to work towards a formal, static semantics of English,
  using First Order Logic as our tool.
  
- But first, some broad perspectives on the study of meaning in natural language.

## In the beginning, there was syntax

- It's all about this guy:

![Noam Chomsky (right)](images/chomsky.jpg){ width=50% }

## In the beginning, there was syntax ii

- (Generative) syntax, when you really get down to it, is the study of
  an individual language (or idiolect) $L$. A "language", such as English, is
  just a useful abstraction over a set of sufficiently similar $L$s. 
  
- The question syntacticians ask themselves is:
  how can we specify what the possible sentences of $L$ are?
  
## Syntactic methodology
  
- Typically, syntacticians do this by giving a *grammar* of $L$.

- Depending on your theory, a grammar can be a set of rewrite rules, a recursive procedure for building
  structured representations, or a combinary logic. It amounts to
  more-or-less the same thing at the end of day.
  
- A grammar of $L$ is taken to be an abstract description of What We Know When
  We Know $L$.
  
## An aside

- Some (generative) theories of syntax:
  - Lexical Functional Grammar, Combinary Categorial Grammar, Minimalism, ...

 - I'm going to try to stay as neutral as possible about which flavour of syntax
 tastes the best.
 
 - When I *have* to say something about syntax, I'm going to assume a simplified
   version of Chomsky's Government and Binding theory, since it's the one that
   most people seem to have been exposed to.
   
 - I'm happy to argue about, e.g., construction grammar, in the pub...not so much in
   class.

## Syntactic intuitions ii

- How do we know what a possible sentence of $L$ is?
  - If we're a native speaker of $L$, we can consult our own intuitions about
    the acceptability of a given sentence.
  - We can consult a native speaker of $L$.

- The vast majority of the raw data syntacticians deal with is *speaker
  acceptability judgements*, be they collected informally or experimentally.
  
## Meaning as truth-conditions

- To know the meaning of a sentence is to know its *truth conditions*.

![Polish mathematician and Logician Alfred Tarski  
(src: the Oberwolfach photo collection)](images/tarski.jpg){ width=50% }

## Meaning as truth-conditions

(@russians) Russians penetrated U.S. voter systems.

- We don't need to know whether or not (@russians) is *true* to know what it *means*.

- What we do know (roughly), is how the world would have to be for (@russians)
  to be true -- (@russians) is *true* if Russians penetrated U.S. voter systems,
  and *false* otherwise. 
  
- Is this just stating the obvious?

## Semantic intuitions 

 - Let's say we're studying the semantics of a given language $L$, and we have
   the syntax of $L$ pretty well-worked out. 
   
 - Our task as semanticists is to specify a recursive procedure for mapping
   sentences of $L$ to *meanings*.
   
 - How do we know what a given sentence of $L$ means? Just as before, we have to
   rely on native speaker intuitions.
   
## Truth conditions

 - But, we can't just ask our native speaker, what does "snow is white" *mean*?
   We're bound to get a vague or unhelpful answer. Try this out yourselves (if
   you want to annoy your friends).
   
 - Instead, we can ask our native speaker, if in a given situation, a sentence
   of $L$ is *true*, and through asking these questions, we can infer the
   sentences truth-conditions.
   
   (@) If snow is black, is "snow is white" true?
   
## Truth conditions ii

- In many situations, the results seem bleedingly obvious, but it very quickly
  gets more interesting (and complicated).
  
 (@) At least one person from every country has eaten most of its national dishes.
 
 - Semantics then, involves developing a recursive procedure for mapping
   sentences of $L$ to their *truth-conditions*.
   
  - One of the reasons why the Tarskian conjecture doesn't seem so interesting
    at first sight, is that the language that we're using to describe
    truth-conditions is *English*.
    
## The meta- and object- language

- We call the language we use to specify the truth-conditions of a given
  sentence our *metalanguage*.
  
- We call the language we're interested in interpreting - in this case English -
  the *object language*.
  
- When the metalanguage and object language are the same, statements of
  truth-conditions have the feeling of circularity.
  
- What we need, if we're going to develop a satisfactory semantic theory, is a
  completely unambiguous metalanguage, the meaning of which we can state in a
  completely rigorous way...what we need, if a *formal* language.

## Natural language as a formal language

> I reject the contention that an important theoretical difference exists
> between formal and natural languages’ (Montague, 1970)

![the philosopher Richard Montague (1930-1971)](images/montague.jpg){ width=30% }

## Interpretation as a *process*

 - The *dynamic turn* in formal semantics: meaning doesn't lie in *truth
   conditions*, but rather in how a given sentence changes the beliefs of the
   participants (Stalnaker, Heim, Kamp, Groenendijk and Stokhof, etc.).

![the philosopher Robert Stalnaker](images/stalnaker.jpg){ width=50% }

## the semantics of programming languages

 - The perspective on semantics we'll be working towards has important
   connections with the semantics of *programming languages* (here we circle
   back to the Montagovian program).
   
 - In computer science, the *meaning* of a program is how it affects an abstract
   machine *state*. The *state* can be, e.g., the allocation of values to
   locations in memory.
   
- The meaning of a program, therefore, can be thought of as an *instruction for
  changing the current state*.
  
- We'll see examples of this in the next session.

## Reference

- See [Elizabeth Coppock's primer](http://eecoppock.info/DynamicSemantics/Lectures/logic-2up.pdf).
 
- <http://eecoppock.info/DynamicSemantics/Lectures/logic-2up.pdf>

- If I go too fast for you today, please go back and work through this. The majority of what I'll go through is there, in a condensed format.

# Some background, lightning fast

## Truth-tables for propositional logic -- *and*

- *and* ($∧$)

$$
\begin{aligned}[t]
&P &Q & &P ∧ Q\\
&1 &1 & &1\\
&1 &0 & &0\\
&0 &1 & &0\\
&0 &0 & &0
\end{aligned}
$$

## *or*

- *or (inclusive disjunction)* ($∨$)

$$
\begin{aligned}[t]
&P &Q & &P ∨ Q\\
&1 &1 & &1\\
&1 &0 & &1\\
&0 &1 & &1\\
&0 &0 & &0
\end{aligned}
$$

## *if...then...*

- *if then (material implication)* ($→$)

$$
\begin{aligned}[t]
&P &Q & &P → Q\\
&1 &1 & &1\\
&1 &0 & &0\\
&0 &1 & &1\\
&0 &0 & &1
\end{aligned}
$$

## *if and only if*

- *iff (biconditional)* ($↔$)

$$
\begin{aligned}[t]
&P &Q & &P ↔ Q\\
&1 &1 & &1\\
&1 &0 & &0\\
&0 &1 & &0\\
&0 &0 & &1
\end{aligned}
$$

## Set theory

This is a set:

$$
\Set{2,4,6}
$$

This is a set:

$$
\Set{x | x\text{ is a positive even integer less than }7}
$$

These are in fact...the same set.

## The empty set

- This is a set:

$$
\Set{}
$$

- Another way of writing this set is: $\emptyset$.

- There's only ONE $\emptyset$!!! These are all identical to $\emptyset$:

$$
\begin{aligned}[t]
&\Set{x | x\text{ is a married bachelor}}\\
&\Set{x | x\text{ is an even prime number and }x\text{ is not }2}\\
&\Set{x | x\text{ is a reasonably priced flat in Bloomsbury}}
\end{aligned}
$$

## Relations on sets

- $A ⊆ B$ – $A$ is a \alert{subset} of $B$ iff every member of $A$ is a member of $B$.
  this means that $∅$ is a subset of every set (including itself!)
  
- $A ⊂ B$ – $A$ is a \alert{proper subset} of $B$ iff $A ⊆ B$ but $A ≠ B$.

- $A ∪ B$ – the \alert{union} of $A$ and $B$ is the set of all $x$ s.t. $x ∈ A$ or $x ∈ B$.

- $A ∩ B$ – the \alert{intersection} of $A$ and $B$ is the set of all $x$ in both $A$
  and $B$.
  
- $A − B$ – the \alert{difference} of $A$ and $B$ is the set of $x$, s.t. $x ∈
  A$ but $x ∉ B$.
  
## Ordered pairs

- $⟨\metalang{Jeff},\metalang{Britta}⟩$ is the ordered pair of $\metalang{Jeff}$ and $\metalang{Britta}$.

- unlike sets, ordered pairs are order-sensitive:

    $⟨\metalang{Jeff},\metalang{Britta}⟩ ≠ ⟨\metalang{Jeff},\metalang{Britta}⟩$
    
 - ordered pairs are objects just like anything else, so we can gather them up
   in sets.
   
   $$
   \Set{⟨x,y⟩| x\text{ hugs }y}
   $$

## Functions

- A function is something that takes an *input*, and returns a unique *output*.

- For example the operation $f$, which takes an integer and adds $1$ to it. Here
  are some different ways of writing this function:
  
  $$f(x) = x + 1$$
  
  $$
  \left[\begin{aligned}[c]
  &0 \rightarrow 1\\
  &1 \rightarrow 2\\
  &3 \rightarrow 4\\
  &...
  \end{aligned}\right]
  $$
  
## Graphs of functions
  
- $f$ can also be represented as a *set of ordered pairs*, where the first
  member of the pair is the input, and the second is the output. This is called
  the *graph* of the function.
  
  $$\Set{..., ⟨0,1⟩,⟨1,2⟩,⟨3,4⟩,...}$$

  $$\Set{⟨x,y⟩|x\text{ is an integer and }y = x + 1}$$
  
## Anonymous functions with lambdas

- When we wrote the function $f$, we had to give it a name...$f$.

- There's another way to write $f$ without naming it, using a *lambda
  expression*.
  
$$λ x . x + 1$$

- A lambda expression consists of a *head* (the bit before the dot), and the
  *body* (the bit after the dot).
  
- The function head consists of a $λ$ and an accompanying variable, which tells
  us where the argument slots into the function body.
  
- The function body tells us what to do with our argument.

## Application

- We *apply* lambda expressions to values like so:

$$
[λ x . x + 1](4)
$$

- When we apply a lambda expression to an argument, we delete the function head,
  and substitute all matching occurrences of the variable with the argument, so:
  
  $$
   \begin{aligned}[t]
   &̱= 4 + 1\\
   &= 5
   \end{aligned}
  $$

## Nested lambda expressions

- What if we have a function $\textit{subtract}$ that takes two arguments?

$$\textit{subtract}(x,y) = y - x$$

- We can write this as a *curried* (nested) lambda expression, like so:

$$
λx . λ y . y - x
$$

## Nested lambda expressions ii

- Application is left-associative:

$$
\begin{aligned}[t]
&[λ x . λ y . y - x](4)(5)\\
&= [λ y . y - 4](5)\\
&= 5 - 4\\
&= 1
\end{aligned}
$$

- Note that out the output of applying our function to $4$ is *itself* a function:
$λ y . y - 4$.

- Lambda expressions come from the *lambda calculus* – a formal system for
  expressing computation. It's something of a lingua franca in formal semantics,
  but it's a big topic, and I'll try to avoid using it in this class.

  
# Our first formal language: L~1~

## First-order logic without variables

- We'll define a language for dealing with things like verbs and proper names. Let's call it L~1~.
  
- We'll be able to use this language for specifying the truth-conditions of
  sentences like the following:
  
  (@) If Jeff is annoying, then Britta and Annie are bored.  
  $(\metalang{annoying}(J)) → ((\metalang{bored}(B) ∧ \metalang{bored}(A)))$
  
  (@) Troy likes Abed and not Pierce.  
  $\metalang{likes}(T,A) ∧ ¬\metalang{likes}(T,P)$
  
- Don't worry about how to interpret these logical translations just yet. We'll
  get onto that in a sec.
  
## Logical Form

- The logical translation (and hence disambiguation) of natural language
  sentences corresponds to philosophers' notion of *Logical Form*.

![the philosopher Bertrand Russell (1872-1970)](images/russell.jpg){ width=50% }

- This is an important idea philosophically, as the inferential properties of a
  sentence can be read directly off of its Logical Form.
  
## Describing a formal language

- Just like Montague said, the tasks of describing a formal language like L~1~ and a natural
  language like English are really quite similar.
  
- Just like English, L~1~ has a *vocabulary*, which is exactly what it sounds
  like.
  
- Just like English, L~1~ has a *syntax* – this will consist of a set of rules
  for constructing grammatical sentences of L~1~, which, following the parlance
  of logicians, we'll call *well-formed formulae* (wff) of L~1~.
  
- Because L~1~ abstracts away from many of the complexities of English,
  including ambiguity, we'll also be able to give a *semantics* for L~1~, which
  will consist of a procedure for computing the truth-conditions of any given wff.

## Vocabulary of L~1~

1. Individuals contstants/terms: $\textsf{Troy}$, $\textsf{Annie}$,
   $\textsf{Britta}$, etc

   These correspond to *proper names* and *definite
   descriptions* in English.
   
2. Unary predicates: $\textsf{happy}$, $\textsf{bored}$, etc

    These correspond to *adjectives* and *intransitive verbs* in English.

3. Binary predicates: $\textsf{kissed}$, $\textsf{loves}$

    These correspond to *transitive verbs* in English.

## Syntax of L~1~

1. If $π$ is a unary predicate and $α$ is a term, then $π(α)$ is a formula.

2. If $π$ is a binary predicate and α and β are terms, then $π(α,β)$ is a formula.

3. If $ϕ$ is a formula, then $¬ϕ$ is a formula.

4. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∧ ψ]$ is a formula.

5. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∨ ψ]$ is a formula.

6. If $ϕ$ and $ψ$ are formulas, then $[ϕ → ψ]$ is a formula.

7. If $ϕ$ and ψ$ are formulas, then $[ϕ ↔ ψ]$ is a formula.

## An aside on recursion

![Morris Halle (1923-2018) and Noam Chomsky (src: Kai von Fintel)](images/recursion.jpg){ width=50% }

## recursion ii

 > For example, the most elementary property of the language faculty is the
 > property of discrete infinity; you have six-word sentences, seven-word
 > sentences but you don’t have six-and-a-half-word sentences. Furthermore,
 > there is no limit; you can have ten-word sentences, twenty-word sentences and
 > so on indefinitely. That is the property of discrete infinity. (Chomsky, 2000
 > – *The Architecture of Language*)
 
## Chomskyan rewrite rules

- Task: use the following set of rewrite rules to generate some sentences.
  Convince yourself that there is no limit to the number of sentences you can generate.

$$
\begin{aligned}[&]
&\text{V} → \text{hugs}\,|\,\text{kisses}\\
&\text{V'} → \text{say} | \text{believe}\\
&\text{NP} → \text{Britta} | \text{Annie}\\
&\text{VP} → \text{V} \text{NP}\\
&\text{VP} → \text{V'} \text{S}\\
&\text{S} → \text{NP} \text{VP}
\end{aligned}
$$

- What is the crucial component here that is responsible for your ability to
  generate an unlimited number of different sentences?
  
## An even simpler instance of recursion

$$
\begin{aligned}[t]
&\text{S} → \text{S and S}\\
&\text{S} → \text{S or S}\\
&\text{S} → \text{if S then S}
&\end{aligned}
$$

- Does this look familiar?

## Discrete infinity

- our specification of the syntax of L~1~ is *recursive*, just like Chomsky's
  rewrite rules!

4. If $ϕ$ and $ψ$ are \alert{formulas}, then $[ϕ ∧ ψ]$ is a \alert{formula}.

5. If $ϕ$ and $ψ$ are \alert{formulas}, then $[ϕ ∨ ψ]$ is a \alert{formula}.

6. If $ϕ$ and $ψ$ are \alert{formulas}, then $[ϕ → ψ]$ is a \alert{formula}.

- If we're gonna have *any* hope of analysing the meaning of a natural language using a *formal language* such as L~1~, we better hope that our formal language
  is capable of matching natural language's capacity for discrete infinity.

## Questions on syntax of L~1~ 

 - Given a suitable vocabulary, which of the following are formulae of L~1~?

1. $¬¬\metalang{happy}(M)$

2. $\metalang{happy}(A)$

3. $\metalang{happy}(M,J)$

4. $\metalang{loves}(J,M) ∨ \metalang{loves}(M,M)$

5. $[\metalang{loves}(J,M) ↔ \metalang{loves}(M,J)]$

6. $[\metalang{kissed}(M) ↔ \metalang{loves}(M,J)]$

7. $¬[\metalang{loves}(J,M) ← ¬\metalang{loves}(M,J)]$



## Semantics

- The semantics for L~1~ is given in terms of a *model*, i.e., a mathematical
  description of a toy universe.
  
![src: *A Philosopher Lecturing on the Orrery*, Joseph Wright of Derby](images/orrery.jpg)

## Semantics ii

$$
M = ⟨D, I⟩
$$

-  $D$ is the *domain* of all individuals in $M$.

- $I$ is the *interpretation function*; it tells us what the vocabulary of L~1~
  means in $M$.
  
  - our mathematical description of the toy universe therefore, tells us who and
    what exists, and what the expressions in the vocabulary of the language
    we're interested in pick out.
    
## Semantics iii

- The interpretation of an *individual constant*, which you can think of as a
  proper name, will be an individual in the domain.
   
- The interpretation of a unary predicate will be a *set* of individuals.

  e.g., the interpretation of *run* is the set of individuals who run.

- The interpretation of a binary predicate will be a binary relation between
  individuals, i.e., a set of ordered pairs.
  
  e.g., the interpretation of *hugs* is the set of ordered pairs $⟨x,y⟩$, such
  that $x$ hugs $y$.
  
## A note on type-setting conventions

- When we think though the meaning of the English NP "Homer", we need to
  distinguish three levels:
  
  - The object-language expression "Homer", which will be set in the same
    typeface as my notes. This is an NP/DP in the natural language English.
    
  - The metalanguage expression $\metalang{Homer}$, which is an individual
    constant in the vocabulary of our formal language – I'll set metalanguage
    expressions in a serif typeface.
    
  - The person $\entity{Homer}$, who is an entity in our domain. I'll typeset
    entities in the domain in a fixed-width typeface. 
    
- It's important to be mindful of these distinctions as we move forwards...I'm
not perfect, and I might typeset things incorrectly sometimes. It's good
practice for you to correct me if/when this happens!
  
## Semantics iv

 - task: Add some *ternary predicates* to L~1~ (i.e., predicates that take three arguments).
   - what is the interpretation of a ternary predicate in $M$?
   - what syntactic category does a ternary predicate correspond to, intuitively?
   
## Semantics of L~1~ (definition)

 - If $α$ is a predicate or an individual constant, then:
   - $\evalM[M]{α} = I(α)$.
   
 - If $π$ is a unary predicate and $α$ is a individual constant, then:
    - $\evalM[M]{ϕ(α)} = 1\text{ if }\evalM[M]{α} ∈ \evalM[M]{π}$
    - $\evalM[M]{ϕ(α)} = 0$ otherwise
    
 - N.b. we're gonna save ourselves some time in the future by writing *if and
   only if* (iff), to give truth and falsity conditions in one line. Since we're
   assuming the excluded middle (every formula is either true or false), this is harmless.
   
 - Note that $\evalM[M]{.}$ is itself a *function* from any vocabulary item or
   formula $α$ of L~1~ to the semantic value of $α$ in our model $M$.
   
## Semantics of L~1~ continued

- if $π$ is a binary predicate, and $α$ and $β$ are terms, then:
  - $\evalM[M]{π(α,β)} = 1 \mathrm{iff} ⟨\evalM[M]{α},\evalM[M]{β}⟩ ∈ \evalM[M]{π}$
  
- $\evalM[M]{¬ϕ} = 1  \mathrm{iff} \evalM[M]{ϕ} = 0$

- $\evalM[M]{ϕ ∧ ψ} = 1 \mathrm{iff} \evalM[M]{ϕ} = 1 \mathrm{and} \evalM[M]{ψ}
  = 1$
- $\evalM[M]{ϕ ∨ ψ} = 1 \mathrm{iff} \evalM[M]{ϕ} = 1 \mathrm{or} \evalM[M]{ψ}
  = 1$
- $\evalM[M]{ϕ → ψ} = 1 \mathrm{unless} \evalM[M]{ϕ} = 1 \mathrm{and} \evalM[M]{ψ}
  = 0$
- $\evalM[M]{ϕ ↔ ψ} = 1 \mathrm{iff} \evalM[M]{ϕ} = \evalM[M]{ψ}$

## Recursion

- Let's look again at our rule for the semantic value of a conjunctive formula:

- $\evalM[M]{ϕ ∧ ψ} = 1 \mathrm{iff} \evalM[M]{ϕ} = 1 \mathrm{and} \evalM[M]{ψ}$

- $\evalM{.}$...is a recursive function! In other words, it can recycle it's own
  output as input.
  
- If we have a recursive syntax, then we better have a recursive semantics.

## Recursive semantics

- Compute the truth-conditions of the following well-formed formula of L~1~.

$$
(\metalang{happy}(\metalang{Jeff}) ∧ \metalang{happy}(\metalang{Troy})) ∧ \metalang{bored}(\metalang{Britta})
$$

## Exercise

- Convert the following sentences of English into well-formed formulae of L~1~,
and compute their truth-conditions. 

(@) If Jeff is happy, then Britta and Annie are bored.

(@) if Jeff is happy, then Britta is bored or Annie is bored.

(@) Britta isn't bored or happy.

- Make a note of any interesting decision points in translating the sentences of English into formulae of L~1~.

## English as a formal language

 - have we made good on Montague's conjecture?
 
 - Right now, we can only deal with proper names and verbs – we still have a
   long way to go.
   
 - AND as you may have noticed, the procedure for translating English into L~1~
   relies to a large extent on intuition.
   
## The syntax-semantics interface

(@) If Jeff is happy, then Britta is bored or Annie is bored.

- There were two valid translations:

(@) $\metalang{happy}(J) → (\metalang{bored}(B) ∨ \metalang{bored}(A))$

(@) $(\metalang{happy}(J) → \metalang{bored}(B)) ∨ \metalang{bored}(A)$

- Can our procedure for translating sentences of English into formulae ever be
  completely deterministic? What would help?
  
## Structural ambiguity

\input{trees/reading1.tex}

(@) $\metalang{happy}(J) → (\metalang{bored}(B) ∨ \metalang{bored}(A))$

## Structural ambiguity ii

\input{trees/reading2.tex}

(@) $(\metalang{happy}(J) → \metalang{bored}(B)) ∨ \metalang{bored}(A)$

## Compositional semantics

- What we want is a procedure for mapping each *terminal node* to an element of
  our *vocabulary*, and each *non-terminal node* to a well-formed formula.
  
- This is the study of *syntax-semantics interface*, and encompasses a great
  deal of what formal semanticists do, especially in the generative tradition.
  
- I won't really be going into much depth about how this works in this class,
  but if you're interested, the *locus classicus* is @Heimb, but see also
  @jacobson_compositional_2014 for an excellent contemporary introduction. 
  
## Compositional semantics ii 

- Instead, we're going to rely on our semantic intuitions for translating
  English into a formal language, and go from there.
  
- All of the action will be in thinking through what *syntactic* properties our
  formal language should have, and  moreover, specifying a semantics for the
  language which indirectly captures our intuitions about the truth-conditions
  of English sentences.

## First Order Logic (FOL)

- Consider the following sentences of English:

(@) Someone is happy.

(@) It's not the case that everyone is bored.

(@) She is sitting down.

 - Rather than using proper names, we're using *quantificational NPs* like
   *someone*, and *pronouns* like *she*.

## Syntax of FOL

- Note that quantificational NPs and pronouns have the same distribution as
  proper names.
  
- This makes it easy enough to add some extra resources to L~1~.

## Syntax of FOL ii

- For pronouns we're going to add *variables*, for which we'll use the letters
  $x$, $y$, $z$, etc. We'll refer to both *individual constants* like
  $\metalang{Jeff}$ and variables as *terms*.
  
  Why not just add *he, she, they* etc., to our vocabulary as constants? We'll
  see why when we get to the semantics. 
  
- We're also going to add two new logical operators: $∃$, and $∀$, which
  correspond to *someone* and *everyone* (roughly).
  
## Syntax of FOL iii

- the first part of the syntax is just our syntax of L~1~, but with *individual
  constant* replaced by *term*. This means that variables can occupy the same
  environments as proper names. 

1. If $π$ is a unary predicate and $α$ is a \alert{term}, then $π(α)$ is a formula.

2. If $π$ is a binary predicate and α and β are \alert{terms}, then $π(α,β)$ is a formula.

3. If $ϕ$ is a formula, then $¬ϕ$ is a formula.

4. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∧ ψ]$ is a formula.

5. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∨ ψ]$ is a formula.

6. If $ϕ$ and $ψ$ are formulas, then $[ϕ → ψ]$ is a formula.

7. If $ϕ$ and ψ$ are formulas, then $[ϕ ↔ ψ]$ is a formula.

## Syntax of FOL iv

- Quantificational operators are accompanied by variables:

8. If $u$ is a variable and $ϕ$ is a formula, then $∃uϕ$ is a formula.

9. If $u$ is a variable and $ϕ$ is a formula, then $∀uϕ$ is a formula.

## Open vs. closed formulae

- A formula is *open* if it contains free variables, and *closed* otherwise.

- Free variables are those that are not *bound*.

- A variable is *bound* by the closest matching quantifier that
 takes scope over it.

- Task: for each of the following formulae, is it open or closed:

1. $∃ y[\metalang{likes}(x,y)]$

2. $∀ x[\metalang{happy}(x)] ∧ \metalang{arrived}(x)$

3. $∃ z[\metalang{hugs}(z)(z)]$

## Towards a semantics of FOL

- Before we get into the formal nitty-gritty, I want you to think about the
  meaning of the following sentence. Is it possible to express in terms of
  *truth-conditions*?
  
  (@pro) She is Donald Trump's wife.
  
- What factors does the interpretation of (@pro) depend on?

## Assignments

 - Intuitively, whether or not (@pro) is true, depends on who the speaker
   intended to refer to with the pronoun *she*. 
   
 - If the speaker intended to refer to Melania Trump, then (@pro) is true, and
   otherwise it is false.
   
## Assignments ii

 - We can use multiple occurrences of the same pronoun to refer to different
   individuals.
   
   (@) She is Donald Trump's wife and *she* is Bill Clinton's wife.
   
 - For this reason, we have to relativize the truth of a sentence to who the
   speaker intended each *tokening* of a pronoun to refer to.
   
 - This is why we need something like variables in our formal language. We need
   a device for distinguishing between occurrences of pronouns.
   
## Assignments iii

- As a notational convenience, we will write things like this:

(@) She$_x$ is Donald Trump's wife, and she$_y$ is Bill Clinton's wife.

- This tells us that the first *she* corresponds to the variable $x$ in the
  logical translation, and the second *she* corresponds to the variable $y$.
  
## Assignments iv

- Ok, so the translation of *She$ₓ$ is Donald Trump's wife* is the following:

$$
\metalang{wife}(\metalang{Trump},x)
$$

- How do we capture the notion that the truth of this formula is relative to who
the pronoun refers to?

- We're going to *relativise* truth, to a *context* $g$. Formally, $g$ is a
  function from variables to objects, i.e., an *assignment function*.
  
## Assignments v

$$
g₁ = \left[\begin{aligned}[c]
    &x &↦ &\entity{Melania}\\
    &y &↦ &\entity{Hilary}\\
    &...
    \end{aligned}\right]
$$

$$
g₂ = \left[\begin{aligned}[c]
    &x &↦ &\entity{Hilary}\\
    &y &↦ &\entity{Melania}\\
    &...
    \end{aligned}\right]
$$

## Assignments vi

- $\metalang{wife}(\metalang{Trump},x)$ is true relative to the assignment $g₁$
  but false relative to the assignment $g₂$.
  
## Assignments vii

- From now on, interpretation isn't just relative to a model $M$, but also
  relative to an assignment $g$.
  
- Instead of $\evalM[M]{ϕ}$, we write $\evalM[M,g]{ϕ}$.

- The interpretation of a variable $x$ is just whatever the assignment $g$ maps
it to.

- $\evalM[M,g]{x} = g(x)$

- $\evalM[M,g₁]{x} = \entity{Melania}$;  $\evalM[M,g₂]{x} = \entity{Hilary}$ 

## Semantics of FOL

- The most important new rule we'll be dealing with is the following:

- If $α$ is a variable, then $\evalM[M,g]{α} = g(α)$

- Most of the rest of our semantic rules will be identical to those of L~1~, but
  with an additional parameter for the assignment $g$.
  
## Semantics of FOL ii

- If $α$ is a predicate or an individual constant, then:
   - $\evalM[M,g]{α} = I(α)$.
   
 - If $π$ is a unary predicate and $α$ is a individual constant, then:
    - $\evalM[M,g]{ϕ(α)} = 1\text{ iff }\evalM[M,g]{α} ∈ \evalM[M,g]{π}$
    
 - if $π$ is a binary predicate, and $α$ and $β$ are terms, then:
   - $\evalM[M,g]{π(α,β)} = 1 \metalang{iff} ⟨\evalM[M,g]{α},\evalM[M,g]{β}⟩ ∈ \evalM[M,g]{π}$
   
## Semantics of FOL iii

- $\evalM[M,g]{¬ϕ} = 1  \metalang{iff} \evalM[M,g]{ϕ} = 0$

- $\evalM[M,g]{ϕ ∧ ψ} = 1 \metalang{iff} \evalM[M,g]{ϕ} = 1 \metalang{and} \evalM[M,g]{ψ}
  = 1$
- $\evalM[M,g]{ϕ ∨ ψ} = 1 \metalang{iff} \evalM[M,g]{ϕ} = 1 \metalang{or} \evalM[M,g]{ψ}
  = 1$
- $\evalM[M,g]{ϕ → ψ} = 1 \metalang{unless} \evalM[M,g]{ϕ} = 1 \metalang{and} \evalM[M,g]{ψ}
  = 0$
- $\evalM[M,g]{ϕ ↔ ψ} = 1 \metalang{iff} \evalM[M,g]{ϕ} = \evalM[M,g]{ψ}$

## Pronouns

- We now have all of the resources we need for translating a subset of sentences
  of English with pronouns into FOL, and assigning them truth-conditions. Do
  this for the following sentence:
  
  (@indices) She arrived and she sat down.
  
 - Make a note of the decisions you have to make when you translate (@indices)
   into FOL.
   - What do you notice?
   - How does it affect the truth conditions.
   
## Pronouns ii

 - There are two candidate translations (Logical Forms) for (@indices):
 
 (@indices1) $\metalang{arrived}(x) ∧ \metalang{satDown}(x)$
 
 (@indices2) $\metalang{arrived}(x) ∧ \metalang{satDown}(y)$
 
## Co-indexation

$$\begin{aligned}[t]
\evalM[M,g]{\metalang{arrived}(x) ∧ \metalang{satDown}(x)} = 1\metalang{ iff }\\
g(x) ∈ I(\metalang{arrived})\text{ and }g(x) ∈ I(\metalang{satDown})
\end{aligned}$$

- Since an *assignment function* is a *function*, when we map two pronouns to
  the same variable, they are *guaranteed* to pick out the same individual
  relative to any assignment.
  
## Contra-indexation

$$\begin{aligned}[t]
\evalM[M,g]{\metalang{arrived}(x) ∧ \metalang{satDown}(y)} = 1\metalang{ iff }\\
g(x) ∈ I(\metalang{arrived})\text{ and }g(y) ∈ I(\metalang{satDown})
\end{aligned}$$

 - when we map two pronouns to distinct variables, is it *guaranteed* that they
   pick out distinct variables, relative to any assignment?
   
## Contra-indexation ii

 - no.
 
 - Consider the assignment $g_c = \left[\begin{aligned}[c]
   &x &↦ &\entity{Hilary}\\
   &y &↦ &\entity{Hilary}\\
 \end{aligned}\right]$
 
$$\begin{aligned}[t]
\evalM[M,g_c]{\metalang{arrived}(x) ∧ \metalang{satDown}(y)} = 1\metalang{ iff }\\
\entity{Hilary} ∈ I(\metalang{arrived})\text{ and }\entity{Hilary} ∈ I(\metalang{satDown})
\end{aligned}$$

## Contra-indexation iii

- but, if we map two pronouns to distinct variables, we make it *possible* for
  them to pick out distinct individuals. Consider the following assignment:
  
  $$g_d = \left[\begin{aligned}[c]
   &x &↦ &\entity{Hilary}\\
   &y &↦ &\entity{Melania}\\
 \end{aligned}\right]$$
 
$$\begin{aligned}[t]
\evalM[M,g_d]{\metalang{arrived}(x) ∧ \metalang{satDown}(y)} = 1\metalang{ iff }\\
\entity{Hilary} ∈ I(\metalang{arrived})\text{ and }\entity{Melania} ∈ I(\metalang{satDown})
\end{aligned}$$

## Assignments and contexts

- We can think of an assignment $g$ as formalising aspects of the *context of
  utterance*.
  
- $g_c$ represents a context in which both "she$ₓ$" and "she$_y$" are intended
  to pick out $\entity{Hilary}$.
  
- $g_d$ represents a context in which "she$ₓ$" is intended to pick out
  $\entity{Hilary}$, and "she$_y$" is intended to pick out $\entity{Melania}$.
  
## Assignments and the global environment

- Computer programs often need access to a *global environment*.

- For example, imagine a program that pull's a user's first name and surname
  from a database, and concatenates them.
  
- The *meaning* of this program can be thought of as assignment sensitive:

```
query g  
println (g(firstName) ++ g(surname))
```

- $g$ here is an assignment function, standing in for an entry in a database
  specifying an individuals first name and surname.
  
## Assignments and the global environment ii

- The formal tools computer programmers use for thinking about the role the
  global environment plays look *extremely* similar to the tools we're using to
  analyse the *context*.
  
- If you have some background in programming, take a look at the *Reader* monad
  in functional languages like *Haskell*.
  
- If not don't worry - hopefully the basic idea is intuitive enough.
  
## Back to quantificational NPs

- we still haven't said anything about the meaning of sentences like the
  following:
  
  (@) Someone arrived.
  
  (@) Everyone arrived.
  
- It turns out that *assignments* provide us with the machinery to analyse these
cases too.

## The informal idea

(@exist1) Someone arrived.

(@exist2) $\evalM[M,g]{∃ x[\metalang{arrived}(x)]}$

- When is (@exist2) true relative to an assignment $g$?

- Intuitively, it's truth is *assignment-invariant* – that is to say that it
  doesn't depend on what the context of utterance is.
  
- It's true just in case we can find *any* assignment $g'$, which is identical
  to $g$ except for what it assigns $x$ to, which makes (@exist2) true.
  
## Illustration

(@) $\entity{arrive} = \Set{\entity{Melania}}$

(@) $g = \left[\begin{aligned}[c]
&x &↦ &\entity{Hilary}\\
&y &↦ &\entity{Melania}
\end{aligned}\right]$

- the truth of $\evalM[M,g]{∃ x[\metalang{arrived}(x)]}$ doesn't depend on what
  $g$ maps $x$ to, but rather if we can find a $g'$ that maps $x$ to someone
  that arrived.
  
- We can find such a $g'$: $\left[\begin{aligned}[c]
&x &↦ &\entity{Melania}\\
&y &↦ &\entity{Melania}
\end{aligned}\right]$

## Formalism

- We can state the rule for quantificational sentences more formally like so;

- $\evalM[M,g]{∃ v ϕ} = 1$ iff there is at least one $g'$ s.t. $g'[v]g$ and $\evalM[M,g']{∃ v ϕ} = 1$

- $\evalM[M,g]{∀ v ϕ} = 1$ iff for every $g'$ s.t. $g'[v]g$, $\evalM[M,g']{∃ v ϕ} = 1$

## Minimally differing assignments

- Why do we look at only *minimally* differing assignments?

(@) $∃ x[\metalang{arrive}(x) ∧ \metalang{satDown}(y)]$

- Let's say that we're in a context with the following $g$:
$\left[\begin{aligned}[c]
&x &↦ &\entity{Melania}\\
&y &↦ &\entity{Hilary}
\end{aligned}\right]$

- And let's say that it's true that Hilary arrived but only Melania sat down.

## Minimally differing assignments ii

- Well, if we're allowed to look at assignments that differ in more than just
  what $x$ gets mapped to, then we *can* find an assignment $g'$ which makes the
  formula true.
  
  $$
  g' = \left[\begin{aligned}[c]
  &x &↦ &\entity{Hilary}\\
  &y &↦ &\entity{Melania}
  \end{aligned}\right]
  $$
  
- This is clearly a bad prediction though – the truth of the previous formula
should depend on who $y$ picks out in the context of utterance.

    
## Non-determinism

- We can think of existential quantifiers as triggering a *non-deterministic computation*. When
  considering the truth of $∃x[\metalang{arrive}(x)]$, we compute the truth of
  statements of the form $α ∈ I(\metalang{arrive})$, where $α$ is some object.
  
- As soon as we find one that is true, we travel back to a deterministic world,
  by stating that the formula is true.
  
## Non-determinism ii
  
- This is going to be important once we start looking at dynamic semantics. 

- For now it is important to remember that this is just a metaphor to help you
  think about what existential quantification is doing. See Simon Charlow's
  dissertation for some (very advanced) reading on the connections between
  existential quantification and non-determinism.
  
## Binding

- The fact that quantificational operators manipulate the assignment function
  can be used to analyse the fact that quantifiers can *bind* pronouns,
  reflexives, and other anaphora in
  natural language.
  
  (@) Someone$^x$ likes themselves$ₓ$.
  
  (@) $∃ \alert{x}[\metalang{likes}(x,\alert{x})]$
  
- Binding obtains just in case the variable introduced by the quantificational
  operator matches the variable introduced by the pronoun.
  
## Interpreting binding

- $\evalM[M,g]{∃ x[\metalang{likes}(x,x)]} = 1$ iff...
- $∃ g'[g[x]g'$ and $\evalM[M,g']{\metalang{likes}(x,x)} = 1$
- $∃ g'[g[x]g'$ and $⟨g'(x),g'(x)⟩ ∈ I(\metalang{likes})$

- This is true, if we're in a model, e.g., where..

$$
I(\metalang{likes}) = \Set{⟨\metalang{Melania},\metalang{Melania}⟩, ⟨\metalang{Melania},\metalang{Hilary}⟩}
$$

- and an assignment $g$, s.t. $g(x) = \metalang{Hilary}$

- Since we can find an assignment $g[x]g'$ which makes the embedded formulae
  true. Namely $g'$ s.t., $g'(x) = \metalang{Melania}$.

## A note on crossover

- The classical conception of binding gives rise to the *crossover* problem.

- The following is an example of *strong crossover*.

(@) She$_x$ likes someone$^x$.

- Why can we not translate this as: $∃ \alert{x}[\metalang{likes}(\alert{x},x)]$
  
## Exercises

- Translate the following sentences of English into FOL and compute their
  truth-conditions. To make life easier for you, I'm going to diambiguate
  indexation.
  
  (@) It's not the case that someone$^x$ likes themselves$_x$.
  
  (@) If someone is upset, then everyone is unhappy.
  
  (@scopeAmbig) Someone danced with everyone.
  
- Note all of these sentences are ambiguous. Pick a reading when you translate.
Think about how FOL represents the ambiguity.

## Towards a semantics of discourses

- Translate the following into FOL:

(@) Someone$ˣ$ walked in. She$ₓ$ sat down.

- You can assume that two consectutive sentences are *conjoined*.

## Candidate translations

- Conjunction scopes over existential: 

(@) $[∃ x[\metalang{walkedIn}(x)]] ∧ \metalang{satDown}(x)$

- Existential scopes over conjunction:

(@) $∃x[\metalang{walkedIn}(x) ∧ \metalang{satDown}(x)]$

- *Exercise:* Compute the truth conditions of both formulae. What do you notice?

## Conjunction scopes over existential

(@) $\begin{aligned}[t]
&\evalM[M,g]{∃x[\metalang{walkedIn}(x)] ∧ \metalang{satDown}(x)} = 1\text{ iff
}\\
&∃ g'[g[x]g' ∧ g'(x) ∈ I(\metalang{walkedIn})] ∧ (g(x) ∈ I(\metalang{satDown}))
\end{aligned}$

- This seems like a *bad* translation. It can be true, e.g., if only Hilary
  walked in, and only Melania sat down.
  
- Intuitively, it doesn't matter than the two variables are the same, since the
  second variable is outside of the scope of the existential quantifier.

## Existential scopes over conjunction

(@) $\begin{aligned}[t]
&\evalM[M,g]{∃x[\metalang{walkedIn}(x) ∧ \metalang{satDown}(x)]} = 1\text{ iff
}\\
&∃ g'[g[x]g' ∧ g'(x) ∈ I(\metalang{walkedIn}) ∧ g'(x) ∈ I(\metalang{satDown})]
\end{aligned}$

- This seems like a good translation – it is only true the same person both
  walked in and sat down. This is because both variables are within the scope of
  the existential quantifier.
  
## Whats's the problem

- Well, why don't we just allow existential quantifiers to scope out of the
  sentences which contain them?
  
- Problem 1: other quantificational NP's don't behave like this.

    (@) Everyone$ˣ$ walked in. He$ₓ$ sat down.
    
    This cannot be translated as:  
    
    (@) $∀ x[\metalang{walkedIn}(x) → \metalang{satDown}(x)]$
    
## What's the problem ii

- The most robust methodological principle in formal semantics is Frege's
  *principle of compositionality*.
  
![the philosopher Gottlob Frege (1848-1925)](images/frege.jpg){ width=30% }

## What's the problem iii

- Frege's principle of compostionality has had innumerable reformulations, and I
  won't bore you with the original German. In its essence, it says:
  
  *The meaning of a sentence is a function of \alert{the meaning of its parts}
  and \alert{how they are put together}*.
  
- Let's think about how we would translate the *parts* of the following
  sentence:
  
(@) Someone walked in and he sat down.

## What's the problem iv

 - conjunct 1: $∃ x[\metalang{walkedIn}(x)]$
 
 - conjunct 2: $\metalang{satDown}(x)$
 
 - The principle of compositionality tells us that the meaning of a
   *conjunctive* sentence should be the conjunction of the meaning of its parts,
   so we get:
   
 - $∃x[\metalang{walkedIn}(x)] ∧ \metalang{SatDown}(x)$
 
 - our more successful translation violates the principle of compositionality!
 
## What's the problem v

 - It's important to state that, in practice, the principle of compositionality
   is a *methodological* principle, and is not always inviolable.
   
 - However, all else being equal, it would be nice to be able to account for the
   data we've just been considering in a way consistent with the principle of
   compositionality.
   
 - *Dynamic semantics* will allow us to do just that!

# Lecture 2: Dynamic Predicate Logic

## The empirical challenge

 > "If we use standard first-order predicate logic [...] in translating a
 > natural language sentence or discourse, anaphoric pronouns will turn up as
 > bound variables. In many cases, this means that in order to arrive at
 > formulas which are good translations, i.e., which express the right meaning,
 > we have to be pretty inventive, and should not pay too much attention to the
 > way in which the natural language sentence or discourse is built up."
 > ([@groenendijk_dynamic_1991])
 
## Cross-sentential anaphora

(@clauses) A man$^x$ walks in the park. He$_x$ whistles.

(@) $∃ x[\metalang{man}(x) ∧ \metalang{walkInThePark}(x) ∧ \metalang{whistle}(x)]$

- BUT

(@subclause1) A man$ˣ$ walks in the park – $∃ x[\metalang{man}(x) ∧ \metalang{walkedInThePark}(x)]$

(@subclause2) He$ₓ$ whistles. – $\metalang{whistles}(x)$

- (@clauses) $≠$ (@subclause1) $∧$ (@subclause2)

## Donkey sentences

(@donkey1) If a farmer$ˣ$ owns a donkey$ʸ$, he$ₓ$ beats it$_y$. 

(@donkey2) Every farmer who owns a donkey$ʸ$ beats it$_y$.

$$
∀ x∀y\left[
\begin{aligned}[c]
&[\metalang{farmer}(x) ∧ \metalang{donkey}(y) ∧ \metalang{own}(x,y)]\\
&→ \metalang{beat}(x,y)
\end{aligned}\right]
$$

- what happened to translating indefinites like *a donkey* using existential quantification?

## The DPL answer

 > "The general starting point of the kind of semantics that DPL is an instance
 > of, is that the meaning of a sentence does not lie in its truth-conditions,
 > but rather in the way it changes (the representation of) the information of
 > the interpreter" ([@groenendijk_dynamic_1991])
 
## The syntax of DPL

 - The syntax of DPL is more-or-less identical to the syntax of FOL!
 
 - Let's have a brief refresher.
 
## The syntax of DPL ii

1. If $π$ is a unary predicate and $α$ is a \alert{term}, then $π(α)$ is a formula.

2. If $π$ is a binary predicate and α and β are \alert{terms}, then $π(α,β)$ is a formula.

3. If $ϕ$ is a formula, then $¬ϕ$ is a formula.

4. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∧ ψ]$ is a formula.

5. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∨ ψ]$ is a formula.

6. If $ϕ$ and $ψ$ are formulas, then $[ϕ → ψ]$ is a formula.

7. If $ϕ$ and ψ$ are formulas, then $[ϕ ↔ ψ]$ is a formula.

8. If $u$ is a variable and $ϕ$ is a formula, then $∃uϕ$ is a formula.

9. If $u$ is a variable and $ϕ$ is a formula, then $∀uϕ$ is a formula.

## The syntax of DPL iii

- The difference between DPL and FOL is going to lie in the *semantics*.

- Concretely, formulae like (@dynamicBinding) are going to receive sensible
  interpretations.
  
(@dynamicBinding)  $∃ x[\metalang{man}(x) ∧ \metalang{walkedIn}(x)] ∧ \metalang{satDown}(x)$

- First we need some background on characteristic functions and sets.

- We're also going to develop a slightly different perspective on the meanings
  of FOL formulae.

## Prelude to the semantics of DPL: Characteristic functions

- Let's say we have a function $\entity{run'}$ from objects to truth values.

- $\entity{run'}$ maps an object $x$ to true ($1$) just in case $x$ runs, and to
false ($0$) just in case $x$ doesn't run.

- Let's say we're in a world where Jeff runs, but Britta and Annie don't run.

(@) $\entity{run'}(\entity{Jeff}) = 1$

(@) $\entity{run'}(\entity{Britta}) = 0$

(@) $\entity{run'}(\entity{Annie}) = 0$

## Characteristic functions ii

 - The graph of $\entity{run'}$ in this world is:
  
$$
\Set{⟨\metalang{Jeff},1⟩, ⟨\metalang{Britta},0⟩, ⟨\metalang{Annie},0 ⟩}
$$

- We could convey the same information by simply gathering together every object
  for which $\entity{run'}$ returns true:
  
$$
\Set{\metalang{Jeff}}
$$

- This is the meaning we assume for predicates in FOL. $\entity{run'}$ is the
  *characteristic function* of this set.
  
- Functions from a set of objects to truth values can equivalenty be expressed
  as sets of objects.
  
## Sentences express sets of assignments

- Recall in FOL we considered truth-conditions to be relative to an assignment
  $g$.
  
$$
\evalM[M,g]{\metalang{left}(x)} = 1\text{ iff }g(x) ∈ \entity{left}
$$

- Let's say that only Donald left. If we have an assignment $g₁$ s.t. $g₁(x) =
  \metalang{Donald}$ then the formula is true. If we have an assignment $g₂$ s.t.
  $g₂(x) = \metalang{Melania}$ then the formula is false.
  
- In FOL, then, formulae are *functions* from assignments to truth values.

- That means that we can identity the meaning of a formula relative to a model with the set of
  assignments that make it true.
  
## Sentences express sets of assignments

- Let's say we've in a model where only Jeff and Britta run, and only Britta and
  Annie swim.

$$
\evalM[M]{\metalang{run}(x)} = \Set{\begin{aligned}[c]
&[x &↦ &\entity{Jeff}],\\
&[x &↦ &\entity{Britta}]
\end{aligned}}
$$

## The flow of information

- This allows us to observe the flow of information as we added conjucts
  especially clearly.
  
$$
\evalM[M]{\metalang{run}(x)} = \Set{\begin{aligned}[c]
&[x &↦ &\entity{Jeff}],\\
&[x &↦ &\entity{Britta}]
\end{aligned}}
$$

$$
\evalM[M]{\metalang{swim}(x)} = \Set{\begin{aligned}[c]
&[x &↦ &\entity{Britta}],\\
&[x &↦ &\entity{Annie}]
\end{aligned}}
$$

$$
\evalM[M]{\metalang{run}(x) ∧ \metalang{swim}(x)} = \Set{[x ↦ \entity{Britta}]}
$$

- Formulae involving pronouns makes the set of assignments at which the sentence
  is true *shrink*.
  
## Notation for assignments
  
- I'm going to start using more concise notation for assignment functions now.
  $j b j$ is the assignment that maps $x₁$ to $\entity{Jeff}$, $x₂$ to
  $\entity{Britta}$ and $x₃$ to $\entity{Jeff}$.
  
- The assignment $j b j$ is equivalent to the following:

$$
\left[\begin{aligned}[c]
&x₁ &↦ &\entity{Jeff}\\
&x₂ &↦ &\entity{Britta}\\
&x₃ &↦ &\entity{Jeff}
\end{aligned}\right]
$$

## Notation for assignments ii

- $\Set{\begin{aligned}[c]
 j j\\
 j b\\
 j a
\end{aligned}}$ is the set of assignments which always map $x₁$ to
 $\entity{Jeff}$. 
 
- Intuitively we can think of this as a context where the value of $x₁$ is known.

## Notation for assignments iii

- This notation will help us see more clearly how, as we add conjuncts with free
  variables, the level of uncertainty is reduced. Let's say there are two 
  variables, $x₁$, $x₂$.
  
$$
\evalM[M]{\metalang{run}(x₁)} = \Set{\begin{aligned}[c]
j j \\
j b \\
j a \\
b b \\
b j \\
b a
\end{aligned}}; \evalM[M]{\metalang{swim}(x₁)} = \Set{\begin{aligned}[c]
b b\\
b j\\
b a\\
a a\\
a b\\
a j
\end{aligned}}
$$

## Notation for assignments ii

\evalM[M]{\metalang{run}(x₁) ∧ \metalang{swim}(x₁)} = \Set{\begin{aligned}[c]
b b\\
b j\\
b a
\end{aligned}}

- Conjoining the two statements about $x₁$ means that we can only be in a
  context where we're completely certain that $x₁$ picks out $\entity{Britta}$.

## The flow of information ii

- Existential statements, on the other hand, don't have the same effect as
  statements with free variables. Let's
  say we have two variables to consider, $x₁$ and $x₂$, and the world is as
  before.
  
## The flow of information iii

$$
\evalM[M]{∃ x₁[\metalang{run}(x₁)]} = \Set{
\begin{aligned}[c]
&j j, j b, b j,\\
&b b, b a, a b,\\
&a a, j a, a j
\end{aligned}
}
$$

$$
\evalM[M]{∃ x₂[\metalang{swim}(x₂)]} = \Set{
\begin{aligned}[c]
&j j, j b, b j,\\
&b b, b a, a b,\\
&a a, j a, a j
\end{aligned}
}
$$

## The flow of information iv

- Existential statements then, take all possible assignments, and just return
  them if the existential statement is true in the model, and reject them otherwise.

$$
\evalM[M]{∃ x₁[\metalang{run}(x₁)] ∧ ∃ x₂[\metalang{swim}(x₂)]} = \Set{
\begin{aligned}[c]
&j j, j b, b j,\\
&b b, b a, a b,\\
&a a, j a, a j
\end{aligned}
}
$$

- If nobody runs, there is no assigment $g$ which will make the conjunctive
  statement true, so:
  
$$
\evalM[M]{∃ x₁[\metalang{run}(x₁)] ∧ ∃ x₂[\metalang{swim}(x₂)]} = ∅
$$
  
## The flow of information v

- Generally speaking, thinking of formula of FOL as sets of assignments helps us
  understand the following intuitive generalizations:
  
- Formulae with free variables typically *reduce uncertainty* about intended
  reference.
  
- Formulae with no free variables don't reduce uncertainty about intended
  reference.
  
- Intuitively, this links up with the *impossibility*, in a static setting, of
  an existential quantifier binding a variable outside of it's scope.
  
## Back to DPL

- In FOL, the interpretation of a formula in a given model can be thought of as
  a set of assignments $g$ – those which make the formula true.
  
- In DPL, the interpretation of a formula in a given model is rather going to be
  sets of *pairs* of assignments $⟨i,o⟩$.
  
- $i$ represents an input assignment, and $o$ represents the output assignment
  resulting from the interpretation procedure.
  
## Dynamic Existential Quantification

$$\evalM{∃x ϕ} = \Set{⟨i,o⟩| ∃k: k[x]i\metalang{ and }⟨k,o⟩ ∈ \evalM{ϕ}}$$

- Existential quantification then, takes an input assignment $i$ and returns an
  output assignment $o$, where $o$ is the result of interpreting $ϕ$ relative to
  a shifted assignment $k$.
  
- Don't worry too much about exactly how this works. We'll go through some
  derivations in detail in a little while.
  
- Since assignments represent the *context of utterance*, existentials are
  interpreted as *instructions for updating the context of utterance*.
  
## Semantics of DPL

- If $π$ is a unary predicate and $α$ is a term, then $\evalM{π(α)} =
  \Set{⟨i,o⟩| i = o \metalang{ and } \evalM[o]{α} ∈ \evalM{π}}$.
  
- If $π$ is a binary predicate and $α$ and $β$ terms, then $\evalM{π(α,β)} =
  \Set{⟨i,o⟩| i = o \metalang{ and } ⟨\evalM[o]{α},\evalM[o]{β}⟩ ∈ \evalM{π}}$.
  
## Exercise

- Assume a model where:
  - $D = \Set{\metalang{Jeff},\metalang{Annie},\metalang{Britta}}$
  - Jeff hugs everyone, everyone hugs themselves, and nobody hugs anyone else.
  - Only Jeff is happy.
  - There are two variables $x₁$ and $x₂$.
  
- Compute the meanings of the following formulae as sets of ordered pairs of
  assignments:
  
(@) $\metalang{hugs}(x₁,x₂)$

(@) $\metalang{happy}(\metalang{Annie})$

(@) $\metalang{hugs}(\metalang{Jeff},x₂)$

## Example solution

$$
\begin{aligned}[t]
&\evalM[M]{\metalang{hugs}(x₁,x₁)} = \\
&\Set{⟨i,o⟩| i = o \metalang{ and }⟨o(x₁),o(x₂)⟩ ∈ I(\metalang{hugs})}
\end{aligned}
$$

- If we're in a model with Jeff, Britta, and Annie, where everybody hugs themselves, and nobody hugs anybody
  else, this is the following set:
  
$$
\Set{
\begin{aligned}[c]
⟨[j j],[j j]⟩,\\
⟨[b b],[b b]⟩,\\
⟨[a a],[a a]⟩
\end{aligned}
}
$$

## Tests

> "[..] atomic formulas do not have dynamic effects of their own. Rather, they
> function as a kind of "test" on incoming assignments. An atomic formula tests
> whether an input assignment satisfies the condition it embodies. If so, the
> assignment is passed on as an output, if not, it is rejected." (G&S, 1991)

## Exercise

$$\evalM{∃x ϕ} = \Set{⟨i,o⟩| ∃k: k[x]i\metalang{ and }⟨k,o⟩ ∈ \evalM{ϕ}}$$

- Compute the meaning of the following formula:

(@) $∃ x[\metalang{hugs}(x₁,\metalang{Annie})]$

- If $π$ is a binary predicate and $α$ and $β$ terms, then $\evalM{π(α,β)} =
  \Set{⟨i,o⟩| i = o \metalang{ and } ⟨\evalM[o]{α},\evalM[o]{β}⟩ ∈ \evalM{π}}$.

## Solution

 - The set of possible assignments:
 
$$
\Set{
\begin{aligned}[c]
&j j, j b,b j\\
&b b, b a,a b\\
&a a, a j,j a
\end{aligned}
}
$$

## Solution ii
 
$$\begin{aligned}[t]
&\evalM{∃ x₁[\metalang{hugs}(x₁,\metalang{Annie})]}\\
&= \Set{⟨i,o⟩| ∃ k[x₁]i\metalang{ and }⟨k,o⟩ ∈ \evalM{\metalang{hugs}(x₁,\metalang{Annie})}}\\
&= \Set{⟨i,o⟩| ∃ k[x₁]i\metalang{ and }⟨k,o⟩ ∈ \Set{⟨i',o'⟩|i' = o'\metalang{ and
}⟨o'(x₁),\metalang{Annie}⟩ ∈ \entity{hugs}}}\\
&= \Set{⟨i,o⟩| ∃ k[x₁]i\metalang{ and }⟨k,o⟩ ∈ \Set{\begin{aligned}[c]
⟨[j j],[j j]⟩,⟨[j b],[j b]⟩,\\
⟨[a b],[a b]⟩,⟨[a a],[a a]⟩,\\
⟨[a j],[a j]⟩,⟨[j a],[j a]⟩
\end{aligned}}}\\
&= \Set{
\begin{aligned}[c]
⟨[j j],[j j]⟩,⟨[j j],[a j]⟩,⟨[j b],[j b]⟩,⟨[j b],[a b]⟩\\
⟨[b j],[j j]⟩,⟨[b j],[a j]⟩,⟨[b b],[j b]⟩,⟨[b b],[b a]⟩\\
⟨[b a],[j a]⟩,⟨[b a],[a a]⟩,⟨[a b],[a b]⟩,⟨[a b],[j b]⟩\\
⟨[a a],[a a]⟩,⟨[a a],[j a]⟩,⟨[a j],[a j]⟩,⟨[a j],[j a]⟩\\
⟨[j a],[j a]⟩,⟨[j a],[a a]⟩
\end{aligned}
}
\end{aligned}$$

## Solution iii

- Existential quantification is *dynamic*, since it potentially changes the
  input assignment.
  
- We can see more clearly what the existential statement does by gathering together the set
  of input assignments and the set of output assignments:
  
  $$
  \left⟨ \Set{
\begin{aligned}[c]
&j j, j b,b j\\
&b b, b a,a b\\
&a a, a j,j a
\end{aligned}},
\Set{
\begin{aligned}[c]
&j j, j b,a b\\
&a a, a j,j a
\end{aligned}}
\right⟩
 $$
 
- $\exists x₁[\metalang{hugs}(x₁,\metalang{Annie})]$ takes all assignments as
  its input, and outputs those assignments where $x₁$ is mapped to someone who
  hugged Annie – namely, Jeff or Annie.
  
## Dynamic conjunction

- $\evalM{[ϕ ∧ ψ]} = \Set{⟨i,o⟩|∃ k:⟨i,k⟩ ∈ \evalM{ϕ}\text{ and }⟨k,o⟩ ∈ \evalM{ψ}}$

- Our definition for dynamic conjunction evaluates the first conjunct $ϕ$
  relative to the input assignment $i$, resulting in $k$, then threads $k$ into $ψ$.
  
## Dynamic conjunction ii

(@) Someone$^{x¹}$ hugged Annie. They$ₓ$ are happy.

(@) $∃ x₁[\metalang{hugged}(x₁,\metalang{Annie})] ∧ \metalang{happy}(x₁)$

## Dynamic conjunction iii

- We know how the first conjunct is evaluated:

$$
\begin{aligned}[t]
&\evalM{∃x₁[\metalang{hugged}(x₁,\metalang{Annie})]}\\
&=\Set{
\begin{aligned}[c]
⟨[j j],[j j]⟩,⟨[j j],[a j]⟩,⟨[j b],[j b]⟩,⟨[j b],[a b]⟩\\
⟨[b j],[j j]⟩,⟨[b j],[a j]⟩,⟨[b b],[j b]⟩,⟨[b b],[b a]⟩\\
⟨[b a],[j a]⟩,⟨[b a],[a a]⟩,⟨[a b],[a b]⟩,⟨[a b],[j b]⟩\\
⟨[a a],[a a]⟩,⟨[a a],[j a]⟩,⟨[a j],[a j]⟩,⟨[a j],[j a]⟩\\
⟨[j a],[j a]⟩,⟨[j a],[a a]⟩
\end{aligned}
}
\end{aligned}
$$

## Dynamic conjunction iv

- And we know how the second conjunct should be evaluated:

$$
\begin{aligned}[t]
&\evalM{\metalang{happy}(x₁)}\\
&=\Set{
\begin{aligned}[c]
⟨[j j],[j j]⟩,⟨[j b],[j b]⟩,⟨[j a],[j a]⟩
\end{aligned}
}
\end{aligned}
$$

## Dynamic conjunction v


- $\evalM{[ϕ ∧ ψ]} = \Set{⟨i,o⟩|∃ k:⟨i,k⟩ ∈ \evalM{ϕ}\text{ and }⟨k,o⟩ ∈ \evalM{ψ}}$

$$
\begin{aligned}[t]
&\evalM{∃x₁[\metalang{hugged}(x₁,\metalang{Annie})] ∧ \metalang{happy}(x₁)}\\
&= \Set{
\begin{aligned}[c]
⟨[j j],[j j]⟩,⟨[j b],[j b]⟩\\
⟨[b j],[j j]⟩,⟨[b b],[j b]⟩\\
⟨[b a],[j a]⟩,⟨[a b],[j b]⟩\\
⟨[a a],[j a]⟩,⟨[a j],[j a]⟩\\
⟨[j a],[j a]⟩
\end{aligned}
}
\end{aligned}$$

# Lecture 3: Discourse referents

## Variables in programming languages

- In the vast majority of programming languages, *variables*, such as `x`, `y`,
  `z`, etc., can be used as placeholders for values.
  
- Consider the following program `main` (written in the `Rust` programming language).

- Ignoring the boilerplate, `main` introduces a variable named `x`, sets `x`'s
  value to the integer `5`, and prints the result of `x + 1`.

```
fn main() {
    let x = 5;
    println!("{}", x + 1);
    }
```

- Q: what value gets printed when we run `main`? Let's find out...

## Variables ii

- Unsurprisingly, `main` returns `6` -- in the argument to `println!`, `x` is
replaced by the stored value `5`:

```
println!("{}", x + 1)
println!("{}", 5 + 1)
println!("{}", 6)
```

## Variables iii

- Now let's change `main` a bit.

```
fn main() {
    let x = 5;
    x = x + 4;
    println!("{}", x + 1);
    }
```

- what happens when we run `main`?


## Variables iv

- Whoops! the `Rust` compiler throws out an error:

```
let x = 5;
    - first assignment to `x`

x = x + 4;
^^^^^^^^^ cannot assign twice to immutable variable
```

- what went wrong?

## (Im)mutability

- In `Rust` (and several other programming languages), variables are by default
  `immutable` (i.e., unchangeable). This means that they are simply *names for values*.
  
- It simply doesn't make sense to write `x = x + 4`, since we're essentially
  assigning two different values to `x`.
  
- What we need in order to make sense of this program is the concept of a *mutable variable* --
  rather than acting as a name for a value, we want our variable to act as an
  *address for a potentially changeable value*.
  
- Conveniently for our purposes, variables in `Rust` can be rendered mutable via
  the `mut` keyword.
  
- OK, let's try that again:

## (Im)mutability II

- Let's try running `main`, but now let's explicitly state that `x` is
  *mutable*.
  
  ```
fn main() {
    let mut x = 5;
    x = x + 4;
    println!("{}", x + 1);
    }
```

- returns: `10`!

- Let's see what's going on here in a little more detail.

## (Im)mutability III

First we introduce a *mutable* variable `x`, and set its value to `5`.

`let mut x = 5;`

Next we retrieve `x`, and set its new value to its old value (`5`) `+ 1`.

```
x = x + 4
x = 5 + 4
x = 9
```

Now we retrieve `x` and print the result of `x + 1`

```
println!("{}", x + 1)
println!("{}", 9 + 1)
println!("{}", 10)
println!("10")
```

## Order sensitivity

Once we introduce mutability, our programs become *order
  sensitive*:
  
```
let mut x = 5;
x = x * 2
x = x - 1
println!("{}", x)
```
prints: `9`

```
let mut x = 5;
x = x - 1
x = x * 2
println!("{}", x)
```
prints: `8`

## Back to natural language

- Think of \alert{a number}.

- Now, multiply \alert{it} by two.

- Now, subtract one from \alert{it}.

- Now, tell me \alert{it}.

## Back to natural language

- Think of \alert{a number}  
  `let mut x = 5`.

- Now, multiply \alert{it} by two.  
  `x = x * 2`  
  `x = 10`
  
- Now, subtract one from \alert{it}.  
  `x = x - 1`  
  `x = 9`

- Now, tell me \alert{it}.  
  `println!("9")`
  
## Back to natural language

- Whoa - we've just made a major discovery! Natural language makes use of
  (something like) *mutable variables*, otherwise the preceding discourse
  wouldn't make sense.
  
- We can think of indefinites like *a number* as introducing new *mutable variables*.
  
- Pronouns, like *it*, refer back to an already-introduced variable.

- The value assigned to a variable can change over the course of a discourse.

## Karttunen's discourse referents

- The idea that indefinites introduce mutable variables is an insight originally
  due to semanticist and computational linguist Lauri Karttunen (although he doesn't use this idiom).
  
![Lauri Karttunen (src: Stefan Müller)](images/karttunen.jpg){ width=40% }

## Karttunen's discourse referents ii

> "Consider a device designed to read a text in some natural language, interpret
> it, and store the content in some manner, say, for the purpose of being able
> to answer questions about it. To accomplish this task, the machine will have
> to filfull at least the following basic requirement. It has to be able to
> build a file that consists of records of alll the individuals, that is,
> events, objects, etc., mentioned in the text and, for each individual, record
> whatever is said about it." ([@karttunen1976])
 
## Cont.
 
  > "I intend to discuss one particular feature a text interpreter must have:
  > that it must be able to recognize when a novel individual is mentioned in
  > the input text and to store it along with its characterization for future
  > reference."
  
## Cont
  
  > "We found that in simple sentences [...] an indefinite NP establishes a
  > \alert{discourse referent} just in case the sentence is an affirmative
  > assertion. By "establishes a discourse referent", we meant that there may be
  > a coreferential pronoun or definite noun phrase later in the discourse."
  
## The dynamic turn

- Karttunen's promise of a text interpreter that keeps track of novel
  individuals mentioned over the course of a discourse (text) was made good upon
  in the eighties, by a new family of semantic theories. Developed independently
  by two linguists: Irene Heim and Hans Kamp.
 
## Discourse Representation Theory

- Hans Kamp introduced *Discourse Representation Theory* (DRT) in his 1981 paper
  *A theory of truth and semantic representation*, as a general theory of anaphora and tense.

![Hans Kamp](images/kamp.jpg){ width=50% }
 
## File Change Semantics

- Irene Heim hit upon a similar theory, *File Change Semantics* (FCS) in chapter
  3 of her classic 1982 dissertation *The
  semantics of definite and indefinite noun phrases*. 

![Irene Heim](images/heim.jpg){ width=25% }

## The two souls of dynamic semantics

- In his 1995 textbook, *Dynamics of meaning*, Gennaro Chierchia describes these
  approaches as "the two souls" of dynamic semantics.
  
- In these classes, we're going to be developing a fragment closer to File
  Change Semantics, and this is for largely contingent reasons (it's the approach 
  I'm more familiar with).

# Motivating dynamic semantics

## Anaphora across conjunction

- Fact: indefinites differ from other quantifiers in their anaphoric potential.

(@every1) \# The dean introduced every new student^*x*^ to Jeff, and the janitor introduced
her~*x*~ to Britta.

(@indef1) The dean introduced a new student^*x*^ to Jeff, and the janitor introduced
her~*x*~ to Britta.

- N.b. I'll use \# as an indictor that a sentence is judged to be *infelicitous*
  or *odd* by a native speaker under the intended reading.

## Placeholder

If (@every1) were acceptable, what would it mean? We can approximate its meaning using
FoL.

$$
∀x\left[\textsf{student}(x) →
\begin{aligned}[c]
&\textsf{introduced}(\textsf{Dean},x,\textsf{Jeff})\\
&\wedge \textsf{introduce}(\textsf{Janitor},x,\textsf{Britta}) 
\end{aligned}\right]
$$

This is a totally sensible meaning. We can even express it in a different way.

(@) For every student, it's the case that the dean introduced her to Jeff and
the Janitor introduced her to Britta.

## Anaphora across sentence boundaries

(@) \# The dean introduced every new student^*x*^ to Jeff.  
The janitor introduced her~*x*~ to Britta.

(@) The dean introduced a new student^*x*^ to Jeff.  
The janitor introduced her~*x*~ to Britta.
