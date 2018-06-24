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
$$

# Perspectives on semantics

## In the beginning, there was syntax

- It's all about this guy:

![Noam Chomsky (right)](images/chomsky.jpg){ width=50% }

## In the beginning, there was syntax ii

- (Generative) syntax, when you really get down to it, is the study of
  an individual language (or idiolect) $L$. A "language", such as English, is
  just a useful abstraction over a set of sufficiently similar $L$s. 
  
- The question syntacticians ask themselves is:
  how can we specify what the possible sentences of $L$ are?[^mn]
   
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

## Syntactic intuitions 

- (Generative) syntax, when you really get down to it, is the study of
  an individual language (or idiolect) $L$. The question we ask ourselves is - how
  can we specify what the possible sentences of $L$ are?
  
- Typically, we do this by giving a *grammar* of $L$. Depending on your theory,
  a grammar can be a set of rewrite rules, a recursive procedure for building
  structured representations, a combinatorial logic, etc etc. It all amounts to
  more-or-less the same thing at the end of day.

## Syntactic intuitions ii

- How do we know what a possible sentence of $L$ is?
  - If we're a native speaker of $L$, we can consult our own intuitions about
    the acceptability of a given sentence.
  - We can consult a native speaker of $L$.

- The vast majority of the raw data syntacticians deal with is *speaker
  acceptability judgements*, be they collected informally or experimentally.

## Back to semantics

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
  
- We'll see examples of this later on.

# A refresher of first-order logic

## Reference

- See [Elizabeth Coppock's primer](http://eecoppock.info/DynamicSemantics/Lectures/logic-2up.pdf).
 
- <http://eecoppock.info/DynamicSemantics/Lectures/logic-2up.pdf>

- If I go too fast for you today, please go back and work through this.

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
&1 &0 & &1\\
&0 &1 & &0\\
&0 &0 & &0
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

 - TODO: insert questions.

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

- TODO add something here.

## Semantics of FOL

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
   
   (@) She is Donalid Trump's wife and *she* is Bill Clinton's wife.
   
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
  function from variables to individual constants, i.e., an *assignment function*.
  
## Assignments v

$$
g₁ = \left[\begin{aligned}[c]
    &x &↦ &\metalang{Melania}\\
    &y &↦ &\metalang{Hilary}\\
    &...
    \end{aligned}\right]
$$

$$
g₂ = \left[\begin{aligned}[c]
    &x &↦ &\metalang{Hilary}\\
    &y &↦ &\metalang{Melania}\\
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

- $\evalM[M,g₁]{x} = \metalang{Melania}$;  $\evalM[M,g₂]{x} = \metalang{Hilary}$ 

# Discourse referents

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
  
[^mn]: {} here is a footnote test. 


