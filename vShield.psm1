F u n c t i o n   C o n n e c t - v S h i e l d S e r v e r   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 C o n n e c t s   t o   a   v S h i e l d   M a n a g e r   S e r v e r .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 C o n n e c t s   t o   a   v S h i e l d   M a n a g e r   S e r v e r .   T h e   c m d l e t   s t a r t s   a   n e w   s e s s i o n   w i t h   a   v S h i e l d   M a n a g e r   S e r v e r   u s i n g   t h e   s p e c i f i e d   p a r a m e t e r s .  
  
 	 	 . P A R A M E T E R     S e r v e r  
 	 	 	 S p e c i f y   t h e   I P   a d d r e s s   o r   t h e   D N S   n a m e   o f   t h e   v S p h e r e   s e r v e r   t o   w h i c h   y o u   w a n t   t o   c o n n e c t .  
  
 	 	 . P A R A M E T E R     U s e r n a m e  
 	 	 	 S p e c i f y   t h e   u s e r   n a m e   y o u   w a n t   t o   u s e   f o r   a u t h e n t i c a t i n g   w i t h   t h e   s e r v e r .    
  
 	 	 . P A R A M E T E R     P a s s w o r d  
 	 	 	 S p e c i f i e s   t h e   p a s s w o r d   y o u   w a n t   t o   u s e   f o r   a u t h e n t i c a t i n g   w i t h   t h e   s e r v e r .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 P S   C : \ >   C o n n e c t - v S h i e l d S e r v e r   - s e r v e r   " 1 9 2 . 1 6 8 . 0 . 8 8 "   - u s e r n a m e   " a d m i n "   - p a s s w o r d   " d e f a u l t "  
 	 # >  
 	 [ C m d l e t B i n d i n g ( ) ]  
 	 P a r a m   (  
 	 	 [ P a r a m e t e r ( V a l u e F r o m P i p e l i n e = $ t r u e ) ]  
 	 	 $ S e r v e r ,  
 	 	 $ U s e r n a m e ,  
 	 	 $ P a s s w o r d  
 	 )  
 	 p r o c e s s   {  
 	 	  
 	 	 i f   ( $ G l o b a l : D e f a u l t v S h i e l d S e r v e r )   {  
 	 	 	 r e t u r n 	 	  
 	 	 }  
 	 	 $ h t t p C l i e n t   =   [ S y s t e m . N e t . W e b R e q u e s t ] : : C r e a t e ( " h t t p s : / / $ s e r v e r / a p i / 2 . 0 / g l o b a l / h e a r t b e a t " )  
 	 	  
 	 	 $ a u t h b y t e s   =   [ S y s t e m . T e x t . E n c o d i n g ] : : A S C I I . G e t B y t e s ( $ u s e r n a m e   +   " : "   +   $ p a s s w o r d )  
 	 	 $ b a s e 6 4   =   [ S y s t e m . C o n v e r t ] : : T o B a s e 6 4 S t r i n g ( $ a u t h b y t e s )      
 	 	 $ a u t h o r i z a t i o n   =   " A u t h o r i z a t i o n :   B a s i c   "   +   $ b a s e 6 4  
 	 	 $ h t t p C l i e n t . H e a d e r s . A d d ( $ a u t h o r i z a t i o n )  
 	 	  
 	 	 $ h t t p C l i e n t . M e t h o d   =   " G E T "  
 	 	 $ r e s p o n s e   =   $ h t t p C l i e n t . G e t R e s p o n s e ( )  
 	 	 I f   ( $ r e s p o n s e . S t a t u s C o d e   - e q   " O K " )   {  
 	 	 	 $ G l o b a l : D e f a u l t v S h i e l d S e r v e r   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 N a m e   =   $ S e r v e r  
 	 	 	 	 S e r v e r U r i   =   " h t t p s : / / $ s e r v e r / "  
 	 	 	 	 A u t h o r i z a t i o n   =   $ a u t h o r i z a t i o n  
 	 	 	 }  
 	 	 W r i t e - H o s t   - F o r e g r o u n d C o l o r   Y e l l o w   " C o n n e c t e d   S u c c e s s f u l l y   t o   $ S e r v e r "  
 	 	 }   E l s e   {  
 	 	 	 T h r o w   " U n a b l e   t o   c o n n e c t   t o   $ S e r v e r ,   d e b u g   i n f o : "  
 	 	 	 T h r o w   $ r e s p o n s e  
 	 	 }    
 	 }  
 }  
 F u n c t i o n   I n v o k e - R e s t A P I   {  
 	 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 I n v o k e s   a   r e s t f u l l   A P I .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 C o n n e c t s   t o   a   r e s t f u l l   A P I   a n d   r e t u r n s   d a t a .  
  
 	 	 . P A R A M E T E R     U R L  
 	 	 	 S p e c i f y   t h e   U R L   t o   u s e   w h e n   a c c e s s i n g   t h e   r e s t   a p i .  
  
 	 	 . P A R A M E T E R     G e t  
 	 	 	 S p e c i f i e s   t h a t   y o u   w i l l   b e   u s i n g   t h e   G E T   M e t h o d    
  
 	 	 . P A R A M E T E R     P u t  
 	 	 	 S p e c i f i e s   t h a t   y o u   w i l l   b e   u s i n g   t h e   P U T   M e t h o d    
 	 	 	  
 	 	 . P A R A M E T E R     D e l e t e  
 	 	 	 S p e c i f i e s   t h a t   y o u   w i l l   b e   u s i n g   t h e   D E L E T E   M e t h o d    
 	 	  
 	 	 . P A R A M E T E R     P o s t  
 	 	 	 S p e c i f i e s   t h a t   y o u   w i l l   b e   u s i n g   p o s t i n g   d a t a    
 	 	  
 	 	 . P A R A M E T E R     D a t a  
 	 	 	 S p e c i f i e s   t h e   d a t a   y o u   w i l l   b e   u s i n g   i n   a   p o s t   m e t h o d  
 	 	  
 	 	 . E X A M P L E  
 	 	 	 P S   C : \ >   I n v o k e - R e s t A P I   - G e t   - U R L   " h t t p s : / / 1 9 2 . 1 6 8 . 0 . 8 8 / a p i / 2 . 0 / a p p / f i r e w a l l / p r o t o c o l s "  
 	 # >  
 	 P a r a m   (  
 	 	 $ U R I ,  
 	 	 [ S y s t e m . M a n a g e m e n t . A u t o m a t i o n . S w i t c h P a r a m e t e r ] $ G e t ,  
 	 	 [ S y s t e m . M a n a g e m e n t . A u t o m a t i o n . S w i t c h P a r a m e t e r ] $ P u t ,  
 	 	 [ S y s t e m . M a n a g e m e n t . A u t o m a t i o n . S w i t c h P a r a m e t e r ] $ D e l e t e ,  
 	 	 [ S y s t e m . M a n a g e m e n t . A u t o m a t i o n . S w i t c h P a r a m e t e r ] $ P o s t ,  
 	 	 $ D a t a  
 	 )  
 	 p r o c e s s   {  
 	 	 i f   ( ( - n o t   $ G e t )   - a n d   ( - n o t   $ P u t )   - a n d   ( - n o t   $ D e l e t e )   - a n d   ( - n o t   $ P o s t ) ) {  
 	 	 	 T h r o w   " N o   M e t h o d   u s e d ,   p l e a s e   s p e c i f y   e i t h e r   G e t ,   P u t ,   D e l e t e   o r   P o s t "  
 	 	 	 r e t u r n  
 	 	 }  
 	 	 i f   ( - n o t   $ U R I )   {  
 	 	 	 T h r o w   " N o   U R I   S p e c i f i e d "  
 	 	 	 r e t u r n  
 	 	 }  
 	 	 i f   ( $ p o s t )   {  
 	 	 	 I f   ( - n o t   $ d a t a )   {  
 	 	 	 	 T h r o w   " Y o u   m u s t   u s e   t h e   - D a t a   p a r a m e t e r   w h e n   s p e c i f y i n g   t h e   P o s t   p a r a m e t e r "  
 	 	 	 	 r e t u r n  
 	 	 	 }  
 	 	 	 $ w c   =   N e w - O b j e c t   S y s t e m . N e t . W e b C l i e n t  
  
 	 	 	 #   A d d   A u t h o r i z a t i o n   h e a d e r s  
 	 	 	 $ U R L   =   ( $ G l o b a l : D e f a u l t v S h i e l d S e r v e r . S e r v e r U r i )   +   $ U R I  
 	 	 	 $ w c . H e a d e r s . A d d ( ( $ G l o b a l : D e f a u l t v S h i e l d S e r v e r . A u t h o r i z a t i o n ) )  
 	 	 	 $ w c . H e a d e r s . A d d ( " C o n t e n t - T y p e " , " a p p l i c a t i o n / x m l " )  
 	 	 	 $ w c . U p l o a d S t r i n g ( $ U R I ,   " P O S T " ,   $ d a t a )  
 	 	 	 r e t u r n  
 	 	 }  
 	 	  
 	 	  
 	 	 #   S e t   M e t h o d  
 	 	 i f   ( $ G e t )   {   $ M e t h o d   =   " G E T "   }  
 	 	 i f   ( $ P u t )   {   $ M e t h o d   =   " P U T "   }  
 	 	 i f   ( $ D e l e t e )   {   $ M e t h o d   =   " D E L E T E "   }  
 	 	  
 	 	 $ h t t p C l i e n t   =   [ S y s t e m . N e t . W e b R e q u e s t ] : : C r e a t e ( $ U R I )  
 	 	 #   A d d   A u t h o r i z a t i o n   h e a d e r s  
 	 	 $ h t t p C l i e n t . H e a d e r s . A d d ( $ G l o b a l : D e f a u l t v S h i e l d S e r v e r . A u t h o r i z a t i o n )  
 	 	 $ h t t p C l i e n t . M e t h o d   =   $ M e t h o d  
 	 	 $ r e s p o n s e   =   $ h t t p C l i e n t . G e t R e s p o n s e ( ) 	  
 	 	 I f   ( $ G e t )   {  
 	 	 	 I f   ( $ r e s p o n s e . S t a t u s C o d e   - e q   " O K " )   {  
 	 	 	 	 $ r e a d e r   =   N e w - O b j e c t   S y s t e m . I O . S t r e a m R e a d e r ( $ r e s p o n s e . G e t R e s p o n s e S t r e a m ( ) )  
 	 	 	 	 [ x m l ] $ X M L   =   $ r e a d e r . R e a d T o E n d ( )  
 	 	 	 	 $ G l o b a l : D e b u g X M L   =   $ X M L  
 	 	 	 	 $ X M L  
 	 	 	 	 r e t u r n  
 	 	 	 }   E l s e   {  
 	 	 	 	 T h r o w   " U n a b l e   t o   c o n n e c t   t o   $ ( $ U R I ) "  
 	 	 	 	 r e t u r n  
 	 	 	 }  
 	 	 }  
 	 }  
 }  
 F u n c t i o n   G e t - v S h i e l d C o m m a n d   {  
 	 G e t - C o m m a n d   - M o d u l e   v S h i e l d  
 }  
 F u n c t i o n   G e t - v S h i e l d S e r v i c e   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   s t a t u s   o f   i n s t a l l e d   v S h i e l d   s e r v i c e s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   s t a t u s   o f   i n s t a l l e d   v S h i e l d   s e r v i c e s .  
  
 	 	 . P A R A M E T E R     V M H o s t  
 	 	 	 T h e   V M H o s t   o b j e c t   t o   c h e c k .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S h i e l d S e r v i c e  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S h i e l d S e r v i c e   - V M H o s t   ( G e t - V M H o s t   v i r t u e s x 1 * )  
 	 # >  
 	 P a r a m   (  
 	 	 $ V M H o s t  
 	 )    
 	  
 	 P R O C E S S   {  
 	 	 i f   ( - n o t   $ V M H o s t )   {  
 	 	 	 $ V M H o s t   =   G e t - V M H o s t    
 	 	 }  
 	 	 F o r e a c h   ( $ V M H   i n   $ V M H o s t )   {  
 	 	 	 $ M o R e f   =   ( $ V M H . I d ) . t r i m ( " H o s t S y s t e m - " )  
 	 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 1 . 0 / v s h i e l d / $ M o R e f "  
 	 	 	 $ X M L . v S h i e l d C o n f i g u r a t i o n . I n s t a l l S t a t u s   |   F o r e a c h   { 	  
 	 	 	 	 $ S t a t u s   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 	 V M H o s t   =   $ V M H . N a m e  
 	 	 	 	 	 P r o g r e s s   =   $ n u l l  
 	 	 	 	 	 P r o g r e s s I n f o   =   $ n u l l  
 	 	 	 	 	 v S h i e l d A p p I n s t a l l e d   =   $ f a l s e  
 	 	 	 	 	 v S h i e l d E n d P o i n t I n s t a l l e d   =   $ f a l s e  
 	 	 	 	 }  
 	 	 	 	 I f   ( $ _ . P r o g r e s s S t a t e )   {  
 	 	 	 	 	 $ S t a t u s . P r o g r e s s   =   $ _ . P r o g r e s s S t a t e  
 	 	 	 	 	 $ S t a t u s . P r o g r e s s I n f o   =   $ _ . P r o g r e s s S u b S t a t e  
 	 	 	 	 }  
 	 	 	 	 I f   ( $ _ . I n s t a l l e d S e r v i c e s )   {  
 	 	 	 	 	 $ S t a t u s . v S h i e l d A p p I n s t a l l e d   =   $ _ . I n s t a l l e d S e r v i c e s . V s z I n s t a l l e d  
 	 	 	 	 	 $ S t a t u s . v S h i e l d E n d P o i n t I n s t a l l e d   =   $ _ . I n s t a l l e d S e r v i c e s . E p s e c I n s t a l l e d  
 	 	 	 	 }  
 	 	 	 	 $ S t a t u s  
 	 	 	 }  
 	 	 }  
 	 }  
 }  
 F u n c t i o n   G e t - v S h i e l d S e c u r i t y G r o u p   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   a l l   s e c u r i t y   g r o u p s   a n d   m e m b e r s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   a l l   s e c u r i t y   g r o u p s   a n d   m e m b e r s .  
  
 	 	 . P A R A M E T E R     D a t a c e n t e r  
 	 	 	 T h e   D a t a c e n t e r   w h i c h   c o n t a i n s   t h e   s e c u r i t y   g r o u p s .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S h i e l d S e c u r i t y G r o u p  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S h i e l d S e c u r i t y G r o u p   - D a t a c e n t e r   ( G e t - D a t a c e n t e r   L o n d o n )  
 	 # >  
 	 P a r a m   (  
 	 	 $ D a t a c e n t e r  
 	 )  
 	 I f   ( - N o t   $ D a t a c e n t e r )   {  
 	 	 $ D a t a c e n t e r   =   G e t - D a t a c e n t e r    
 	 }  
 	 F o r e a c h   ( $ D C   i n   $ D a t a c e n t e r )   {  
 	 	 $ M o R e f   =   ( $ D C . I d ) . t r i m ( " D a t a c e n t e r - " )  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / s e c u r i t y g r o u p / s c o p e / $ M o R e f "  
 	 	 I f   ( $ X M L . l i s t . l e n g t h   - e q   0 )   {   r e t u r n   }  
 	 	 $ X M L . l i s t . s e c u r i t y g r o u p   |   F o r e a c h   {  
 	 	 	 $ A l l I n f o   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 I D   =   $ _ . o b j e c t I d  
 	 	 	 	 D a t a c e n t e r   =   $ D C . N a m e  
 	 	 	 	 N a m e   =   $ _ . n a m e  
 	 	 	 	 D e s c r i p t i o n   =   $ _ . d e s c r i p t i o n  
 	 	 	 	 M e m b e r   =   $ _ . m e m b e r   |   S e l e c t   N a m e ,   O b j e c t T y p e N a m e ,   O b j e c t I D  
 	 	 	 }  
 	 	 	 $ A l l I n f o  
 	 	 }  
 	 }  
 }  
 F u n c t i o n   S e t - v S h i e l d S e c u r i t y G r o u p   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 A m m e n d s   s e c u r i t y   g r o u p s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 A m m e n d s   s e c u r i t y   g r o u p s ,   c u r r e n t l y   o n l y   s e t u p   t o   u s e   w i t h   s e c u r i t y   g r o u p s  
 	 	 	 a t   a   d a t a c e n t e r   l e v e l   a n d   o n l y   t o   a d d / r e m o v e   V M s   o n l y .  
  
 	 	 . P A R A M E T E R     A d d  
 	 	 	 U s e   t h i s   p a r a m a t e r   t o   a d d   t h e   V M   t o   t h e   g r o u p .  
 	 	 	  
 	 	 . P A R A M E T E R     R e m o v e  
 	 	 	 U s e   t h i s   p a r a m a t e r   t o   R e m o v e   t h e   V M   t o   t h e   g r o u p .  
 	 	  
 	 	 . P A R A M E T E R     D a t a c e n t e r  
 	 	 	 T h e   D a t a c e n t e r   w h i c h   c o n t a i n s   t h e   s e c u r i t y   g r o u p .  
  
 	 	 . P A R A M E T E R     S e c u r i t y G r o u p  
 	 	 	 T h e   N a m e   o f   t h e   S e c u r i t y   G r o u p .  
  
 	 	 . P A R A M E T E R     V M  
 	 	 	 T h e   V M   t o   A d d / R e m o v e   t o   t h e   S e c u r i t y   G r o u p .  
  
 	 	 . E X A M P L E  
 	 	 	 S e t - v S h i e l d S e c u r i t y G r o u p   - A d d   - D a t a c e n t e r   ( G e t - D a t a c e n t e r   V i r t u - A l )   - S e c u r i t y G r o u p   " V i e w   S e r v e r s   a n d   C l i e n t s "   - V M   ( G e t - V M   V i e w 0 1 )  
  
 	 	 . E X A M P L E  
 	 	 	 S e t - v S h i e l d S e c u r i t y G r o u p   - R e m o v e   - D a t a c e n t e r   ( G e t - D a t a c e n t e r   V i r t u - A l )   - S e c u r i t y G r o u p   " V i e w   S e r v e r s   a n d   C l i e n t s "   - V M   ( G e t - V M   V i e w 0 1 )  
  
 	 # >  
 	 P a r a m   (  
 	 	 [ S y s t e m . M a n a g e m e n t . A u t o m a t i o n . S w i t c h P a r a m e t e r ] $ A d d ,    
 	 	 [ S y s t e m . M a n a g e m e n t . A u t o m a t i o n . S w i t c h P a r a m e t e r ] $ R e m o v e ,    
 	 	 $ D a t a c e n t e r ,    
 	 	 $ S e c u r i t y G r o u p ,    
 	 	 $ V M  
 	 )  
 	 $ V M M o R e f   =   ( $ V M . I d ) . t r i m ( " V i r t u a l M a c h i n e - " )  
 	 $ S G I d   =   ( G e t - v S h i e l d S e c u r i t y G r o u p   - d a t a c e n t e r   ( $ D a t a c e n t e r )   |   W h e r e   { $ _ . n a m e   - e q   $ S e c u r i t y G r o u p } ) . i d  
 	 I f   ( $ A d d )   {  
 	 	 $ S e t S G   =   I n v o k e - R e s t A P I   - P u t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / s e c u r i t y g r o u p / $ S G I d / m e m b e r s / $ V M M o R e f "  
 	 }   E l s e   {  
 	 	 $ S e t S G   =   I n v o k e - R e s t A P I   - D e l e t e   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / s e c u r i t y g r o u p / $ S G I d / m e m b e r s / $ V M M o R e f "  
 	 }  
 	 G e t - v S h i e l d S e c u r i t y G r o u p   - d a t a c e n t e r   ( $ D a t a c e n t e r )   |   W h e r e   { $ _ . n a m e   - e q   $ S e c u r i t y G r o u p }  
 }  
  
 F u n c t i o n   G e t - v S D S S c a n S t a t u s   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   D a t a   S e c u r i t y   S t a t u s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   D a t a   S e c u r i t y   S t a t u s .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S D S S c a n S t a t u s  
  
 	 # >  
 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / d l p / s c a n s t a t u s "  
 	 $ X M L . D l p S c a n S t a t u s 	 |   F o r e a c h   { 	  
 	 	 $ S t a t u s   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 S t a t u s   =   $ _ . c u r r e n t S c a n S t a t e  
 	 	 	 V M s I n P r o g r e s s   =   $ _ . v m s I n P r o g r e s s  
 	 	 	 V M s C o m p l e t e d   =   $ _ . v m s C o m p l e t e d  
 	 	 }  
 	 	 $ S t a t u s  
 	 }  
 }  
 F u n c t i o n   G e t - v S D S P o l i c y   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   P o l i c i e s   c u r r e n t l y   s e t u p .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   D a t a   S e c u r i t y   p o l i c i e s .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S D S P o l i c y  
  
 	 # >  
 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / d l p / p o l i c y / s a v e d "  
 	 $ X M L . D l p P o l i c y  
 }  
 F u n c t i o n   G e t - v S D S R e g u l a t i o n   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   D a t a   s e c u r i t y   R e g u l a t i o n s   a v a i l a b l e .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   D a t a   S e c u r i t y   R e g u l a t i o n s   a v a i l a b l e .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 G e t - v S D S R e g u l a t i o n  
  
 	 # >  
 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / d l p / r e g u l a t i o n "  
 	 $ X M L . s e t   |   S e l e c t   - E x p a n d P r o p e r t y   R e g u l a t i o n  
 }  
 F u n c t i o n   G e t - v S D S V i o l a t i o n C o u n t   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   D a t a   s e c u r i t y   v i o l a t i o n   c o u n t s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   D a t a   S e c u r i t y   v i o l a t i o n   c o u n t s .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S D S V i o l a t i o n C o u n t  
 	 	 	  
 	 	 . P A R A M E T E R     D a t a c e n t e r  
 	 	 	 T h e   D a t a c e n t e r   w h i c h   t o   g a t h e r   i n f o r m a t i o n   f r o m .  
  
 	 # >  
 	 P a r a m   (  
 	 	 $ D a t a c e n t e r  
 	 )  
 	 P r o c e s s   {  
 	 	 I f   ( - n o t   $ D a t a c e n t e r )   {  
 	 	 	 $ D a t a c e n t e r   =   G e t - D a t a c e n t e r  
 	 	 }  
 	 	 F o r e a c h   ( $ D C   i n   $ D a t a c e n t e r )   {  
 	 	 	 $ M o R e f   =   ( $ D C . I d ) . t r i m ( " D a t a c e n t e r - " )  
 	 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / d l p / v i o l a t i o n s / $ M o R e f "  
 	 	 	 $ X M L . l i s t . V i o l a t i o n s   |   F o r e a c h   {  
 	 	 	 	 $ V i o   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 	 D a t a c e n t e r   =   $ D C . N a m e  
 	 	 	 	 	 R e g u l a t i o n V i o l a t e d   =   $ _ . r e g u l a t i o n . n a m e  
 	 	 	 	 	 C o u n t   =   $ _ . v i o l a t i o n C o u n t  
 	 	 	 	 }  
 	 	 	 	 $ V i o  
 	 	 	 }  
 	 	 }  
 	 }  
 }  
 F u n c t i o n   G e t - v S D S V i o l a t i o n F i l e   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   D a t a   s e c u r i t y   v i o l a t i o n   f i l e s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   D a t a   S e c u r i t y   v i o l a t i o n   f i l e s .  
  
 	 	 . P A R A M E T E R     D a t a c e n t e r  
 	 	 	 T h e   D a t a c e n t e r   w h i c h   t o   g a t h e r   i n f o r m a t i o n   f r o m .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S D S V i o l a t i o n F i l e  
  
 	 # >  
 	 P a r a m   (  
 	 	 $ D a t a c e n t e r  
 	 )  
 	 P r o c e s s   {  
 	 	 I f   ( - n o t   $ D a t a c e n t e r )   {  
 	 	 	 $ D a t a c e n t e r   =   G e t - D a t a c e n t e r  
 	 	 }  
 	 	 F o r e a c h   ( $ D C   i n   $ D a t a c e n t e r )   {  
 	 	 	 $ M o R e f   =   ( $ D C . I d ) . t r i m ( " D a t a c e n t e r - " )  
 	 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / d l p / v i o l a t i n g f i l e s / $ ( $ M o R e f ) ? p a g e s i z e = 5 0 0 0 & s t a r t i n d e x = 0 "  
 	 	 	 $ X M L . V i o l a t i n g F i l e s . d a t a P a g e . V i o l a t i n g F i l e   |   F o r e a c h   {  
 	 	 	 	 $ A l l I n f o   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 	 I D   =   $ _ . i d e n t i f i e r  
 	 	 	 	 	 D a t a c e n t e r N a m e   =   $ _ . d a t a C e n t e r . n a m e  
 	 	 	 	 	 C l u s t e r N a m e   =   $ _ . c l u s t e r . n a m e  
 	 	 	 	 	 V M   =   $ _ . v m . n a m e  
 	 	 	 	 	 F i l e N a m e   =   $ _ . f i l e N a m e  
 	 	 	 	 	 M a t c h e d R e g u l a t i o n s   =   $ _ . v i o l a t i o n s . V i o l a t i o n I n f o   |   F o r e a c h   {   $ _ . r e g u l a t i o n . n a m e   }  
 	 	 	 	 	 L a s t M o d i f i e d   =   $ _ . f i l e L a s t M o d i f i e d T i m e . I n n e r X m l  
 	 	 	 	 	 V i o l a t i o n L a s t D e t e c t e d   =   $ _ . v i o l a t i o n s . V i o l a t i o n I n f o   |   F o r e a c h   {   $ _ . l a s t V i o l a t i o n R e p o r t e d T i m e . I n n e r X m l   }  
 	 	 	 	 }  
 	 	 	 	 $ A l l I n f o  
 	 	 	 }  
 	 	 }  
 	 }  
 }  
 F u n c t i o n   G e t - v S D S E v e n t s   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   D a t a   s e c u r i t y   e v e n t s   i n   v C e n t e r .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   D a t a   S e c u r i t y   e v e n t s   i n   v C e n t e r   f o r   a l l   o b j e c t s  
 	 	 	 o r   f o r   a   g i v e n   V M .  
  
 	 	 . P A R A M E T E R     V M  
 	 	 	 T h e   V M   t o   f i n d   e v e n t s   f o r .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S D S E v e n t s  
  
 	 # >  
 	 P r o c e s s   {  
 	 	 I f   ( $ V M )   {  
 	 	 	 $ V M   |   G e t - V I E v e n t   |   W h e r e   {   $ _ . F u l l F o r m a t t e d M e s s a g e   - l i k e   " v S h i e l d   D a t a   S e c u r i t y   * " }  
 	 	 }   E l s e   {  
 	 	 	 G e t - V I E v e n t   |   W h e r e   {   $ _ . F u l l F o r m a t t e d M e s s a g e   - l i k e   " v S h i e l d   D a t a   S e c u r i t y   * " }  
 	 	 }  
 	 }  
 }  
  
 F u n c t i o n   G e t - v S A p p S t a t u s   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   S t a t u s   o f   v S h i e l d   A p p   f o r   a   d a t a c e n t e r .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   S t a t u s   o f   v S h i e l d   A p p   f o r   a   d a t a c e n t e r .  
  
 	 	 . P A R A M E T E R     D a t a c e n t e r  
 	 	 	 T h e   D a t a c e n t e r   w h i c h   t o   g a t h e r   i n f o r m a t i o n   f r o m .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S A p p S t a t u s  
 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S A p p S t a t u s   - D a t a c e n t e r   ( G e t - D a t a c e n t e r   V i r t u - A l )  
  
 	 # >  
 	 P a r a m   ( $ D a t a c e n t e r )  
 	 P r o c e s s   {  
 	 	 I f   ( - n o t   $ D a t a c e n t e r )   {  
 	 	 	 $ D a t a c e n t e r   =   G e t - D a t a c e n t e r  
 	 	 }  
 	 	 F o r e a c h   ( $ D C   i n   $ D a t a c e n t e r )   {  
 	 	 	 $ M o R e f   =   ( $ D C . I d ) . t r i m ( " D a t a c e n t e r - " )  
 	 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / a p p / f i r e w a l l / $ ( $ M o R e f ) / s t a t e "  
 	 	 	 $ X M L . V s h i e l d A p p C o n f i g u r a t i o n . d a t a c e n t e r S t a t e   |   F o r e a c h   {  
 	 	 	 	 $ A l l I n f o   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 	 I D   =   $ _ . d a t a c e n t e r I d  
 	 	 	 	 	 N a m e   =   $ D C . n a m e  
 	 	 	 	 	 S t a t u s   =   $ _ . s t a t u s  
 	 	 	 	 }  
 	 	 	 	 $ A l l I n f o  
 	 	 	 }  
 	 	 }  
 	 }  
 }  
 F u n c t i o n   G e t - v S A p p P r o t o c o l   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   p r o t o c o l s   a v a i l a b l e .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   p r o t o c o l s   a v a i l a b l e .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S A p p P r o t o c o l  
  
 	 # >  
 	 P r o c e s s   {  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / a p p / f i r e w a l l / p r o t o c o l s "  
 	 	 $ X M L . V s h i e l d A p p C o n f i g u r a t i o n . p r o t o c o l T y p e s  
 	 }  
 }  
 F u n c t i o n   G e t - v S A p p P r o t o c o l T y p e   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   P r o t o c o l   T y p e   a v a i l a b l e .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   P r o t o c o l   T y p e   a v a i l a b l e .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S A p p P r o t o c o l T y p e  
  
 	 # >  
 	 P r o c e s s   {  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / a p p / f i r e w a l l / p r o t o c o l s / a p p l i c a t i o n "  
 	 	 $ X M L . V s h i e l d A p p C o n f i g u r a t i o n . p r o t o c o l s L i s t . p r o t o c o l  
 	 }  
 }  
 F u n c t i o n   G e t - v S A p p P r o t o c o l E t h e r n e t   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   E t h e r n e t   P r o t o c o l s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   E t h e r n e t   P r o t o c o l s .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S A p p P r o t o c o l E t h e r n e t  
  
 	 # >  
 	 P r o c e s s   {  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / a p p / f i r e w a l l / p r o t o c o l s / e t h e r n e t "  
 	 	 $ X M L . V s h i e l d A p p C o n f i g u r a t i o n . p r o t o c o l s L i s t . p r o t o c o l   |   F o r e a c h   {  
 	 	 	 $ O b j   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 L a y e r   =   " L a y e r 2 "  
 	 	 	 	 T y p e   =   " e t h e r n e t "  
 	 	 	 	 P r o t o c o l   =   $ _ . N a m e  
 	 	 	 	 V a l u e   =   $ _ . V a l u e  
 	 	 	 }  
 	 	 	 $ O b j  
 	 	 }  
 	 }  
 }  
 F u n c t i o n   G e t - v S A p p P r o t o c o l I P v 4     {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   I P v 4   P r o t o c o l s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   I P v 4   P r o t o c o l s .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S A p p P r o t o c o l I P v 4  
  
 	 # >  
 	 P r o c e s s   {  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / a p p / f i r e w a l l / p r o t o c o l s / i p v 4 "  
 	 	 $ X M L . V s h i e l d A p p C o n f i g u r a t i o n . p r o t o c o l s L i s t . p r o t o c o l   |   F o r e a c h   {  
 	 	 	 $ O b j   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 L a y e r   =   " L a y e r 3 "  
 	 	 	 	 T y p e   =   " i p v 4 "  
 	 	 	 	 P r o t o c o l   =   $ _ . N a m e  
 	 	 	 	 V a l u e   =   $ _ . V a l u e  
 	 	 	 }  
 	 	 	 $ O b j  
 	 	 }  
 	 }  
 }  
 F u n c t i o n   G e t - v S A p p P r o t o c o l I C M P   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   I C M P   P r o t o c o l s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   I C M P   P r o t o c o l s .  
 	 	 	  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S A p p P r o t o c o l I C M P  
  
 	 # >  
 	 P r o c e s s   {  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / a p p / f i r e w a l l / p r o t o c o l s / i c m p "  
 	 	 $ X M L . V s h i e l d A p p C o n f i g u r a t i o n . p r o t o c o l s L i s t . p r o t o c o l   |   F o r e a c h   {  
 	 	 	 $ O b j   =   N e w - O b j e c t   - T y p e N a m e   P S O b j e c t   - P r o p e r t y   @ {  
 	 	 	 	 L a y e r   =   " L a y e r 3 "  
 	 	 	 	 T y p e   =   " i c m p "  
 	 	 	 	 P r o t o c o l   =   $ _ . N a m e  
 	 	 	 	 V a l u e   =   $ _ . V a l u e  
 	 	 	 }  
 	 	 	 $ O b j  
 	 	 }  
 	 }  
 }  
  
 F u n c t i o n   G e t - v S E S e r v i c e   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   s t a t u s   o f   i n s t a l l e d   v S h i e l d   s e r v i c e s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   s t a t u s   o f   i n s t a l l e d   v S h i e l d   s e r v i c e s .  
  
 	 	 . P A R A M E T E R     V M H o s t  
 	 	 	 T h e   V M H o s t   o b j e c t   t o   c h e c k .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S h i e l d S e r v i c e  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S h i e l d S e r v i c e   - V M H o s t   ( G e t - V M H o s t   v i r t u e s x 1 * )  
 	 # >  
 	  
 	 P R O C E S S   {  
 	 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / n e t w o r k s / e d g e / c a p a b i l i t y "  
 	 	 	 $ X M L . v s h i e l d E d g e C o n f i g . v s e C a p a b i l i t y . v s e C a p a b i l i t y L i s t  
 	 }  
 }  
 F u n c t i o n   G e t - v S E N a t R u l e   ( $ D V P o r t G r o u p )   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   s t a t u s   o f   i n s t a l l e d   v S h i e l d   s e r v i c e s .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   s t a t u s   o f   i n s t a l l e d   v S h i e l d   s e r v i c e s .  
  
 	 	 . P A R A M E T E R     V M H o s t  
 	 	 	 T h e   V M H o s t   o b j e c t   t o   c h e c k .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S h i e l d S e r v i c e  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S h i e l d S e r v i c e   - V M H o s t   ( G e t - V M H o s t   v i r t u e s x 1 * )  
 	 # >  
 	  
 	 P R O C E S S   {  
 	 	 $ N e t w o r k M R   =   $ D V P o r t G r o u p . k e y  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / n e t w o r k s / $ N e t w o r k M R / e d g e "  
 	 	 $ R u l e s   =   @ ( )  
 	 	 $ X M L . v s h i e l d E d g e C o n f i g . n a t C o n f i g . r u l e   |   F o r e a c h   {  
 	 	 	 $ N e w R u l e   =   " "   |   S e l e c t   t y p e ,   p r o t o c o l ,   i n t e r n a l I p A d d r e s s ,   I n t e r n a l P o r t ,   E x t e r n a l I P A d d r e s s ,   E x t e r n a l P o r t ,   E n a b l e L o g  
 	 	 	 $ N e w R u l e . t y p e   =   $ _ . t y p e  
 	 	 	 $ N e w R u l e . p r o t o c o l   =   $ _ . p r o t o c o l  
 	 	 	 $ N e w R u l e . i n t e r n a l I p A d d r e s s   =   $ _ . i n t e r n a l I p A d d r e s s  
 	 	 	 $ N e w R u l e . I n t e r n a l P o r t   =   $ _ . I n t e r n a l P o r t  
 	 	 	 $ N e w R u l e . E x t e r n a l I P A d d r e s s   =   $ _ . E x t e r n a l I P A d d r e s s  
 	 	 	 $ N e w R u l e . E x t e r n a l P o r t   =   $ _ . E x t e r n a l P o r t  
 	 	 	 $ N e w R u l e . E n a b l e L o g   =   $ _ . E n a b l e L o g  
 	 	 	 $ R u l e s   + =   $ N e w R u l e  
 	 	 }  
 	 	 $ R u l e s  
 	 }  
 }  
 F u n c t i o n   N e w - v S E N a t R u l e   ( $ t y p e ,   $ I n t e r n a l I P A d d r e s s ,   $ E x t e r n a l I P A d d r e s s ,   $ D V P o r t G r o u p ,   $ I n t e r n a l p o r t ,   $ E x t e r n a l p o r t ,   $ E n a b l e L o g ,   $ p r o t o c o l )   {  
 	 $ N e t w o r k M R   =   $ D V P o r t G r o u p . k e y  
 	 i f   ( $ t y p e   - n e   " d n a t "   - a n d   $ t y p e   - n e   " s n a t " )   {  
 	 	 W r i t e - H o s t   " P l e a s e   s p e c i f y   a   t y p e   o f   e i t h e r   d n a t   o r   s n a t "  
 	 	 R e t u r n  
 	 }  
 	  
 	 $ N e w R u l e   =   " "   |   S e l e c t   t y p e ,   p r o t o c o l ,   i n t e r n a l I p A d d r e s s ,   I n t e r n a l P o r t ,   E x t e r n a l I P A d d r e s s ,   E x t e r n a l P o r t ,   E n a b l e L o g  
 	 $ N e w R u l e . t y p e   =   $ t y p e  
 	 $ N e w R u l e . i n t e r n a l I p A d d r e s s   =   $ I n t e r n a l I P A d d r e s s  
 	 $ N e w R u l e . E x t e r n a l I P A d d r e s s   =   $ E x t e r n a l I P A d d r e s s  
 	 $ N e w R u l e . I n t e r n a l P o r t   =   $ I n t e r n a l p o r t  
 	 $ N e w R u l e . E x t e r n a l P o r t   =   $ E x t e r n a l p o r t  
 	 $ N e w R u l e . E n a b l e L o g   =   $ E n a b l e L o g  
 	 $ N e w R u l e . p r o t o c o l   =   $ p r o t o c o l  
 	  
 	 $ A l l R u l e s   =   @ ( )  
 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / n e t w o r k s / $ N e t w o r k M R / e d g e "  
 	 $ X M L . v s h i e l d E d g e C o n f i g . n a t C o n f i g . r u l e   |   F o r e a c h   {  
 	 	 $ C u r r r e n t R u l e   =   " "   |   S e l e c t   t y p e ,   p r o t o c o l ,   i n t e r n a l I p A d d r e s s ,   I n t e r n a l P o r t ,   E x t e r n a l I P A d d r e s s ,   E x t e r n a l P o r t ,   E n a b l e L o g  
 	 	 $ C u r r r e n t R u l e . t y p e   =   $ _ . t y p e  
 	 	 $ C u r r r e n t R u l e . p r o t o c o l   =   $ _ . p r o t o c o l  
 	 	 $ C u r r r e n t R u l e . i n t e r n a l I p A d d r e s s   =   $ _ . i n t e r n a l I p A d d r e s s  
 	 	 $ C u r r r e n t R u l e . I n t e r n a l P o r t   =   $ _ . I n t e r n a l P o r t  
 	 	 $ C u r r r e n t R u l e . E x t e r n a l I P A d d r e s s   =   $ _ . E x t e r n a l I P A d d r e s s  
 	 	 $ C u r r r e n t R u l e . E x t e r n a l P o r t   =   $ _ . E x t e r n a l P o r t  
 	 	 $ C u r r r e n t R u l e . E n a b l e L o g   =   $ _ . E n a b l e L o g  
 	 	 $ A l l R u l e s   + =   $ C u r r r e n t R u l e  
 	 }  
 	 $ A l l R u l e s   + =   $ N e w R u l e  
  
 $ B o d y   =   @ "  
 < v s h i e l d E d g e C o n f i g   x m l n s = " v m w a r e . v s h i e l d . e d g e . 2 . 0 " >  
 	 < n a t C o n f i g >  
 	  
 " @  
  
 $ A l l R u l e s   |   F o r e a c h   {  
 $ B o d y   + =   @ "  
 	 	 < r u l e >  
 	 	 	 < t y p e > $ ( $ _ . t y p e ) < / t y p e >  
 	 	 	 < p r o t o c o l > $ ( $ _ . p r o t o c o l ) < / p r o t o c o l >  
 	 	 	 < i n t e r n a l I p A d d r e s s > $ ( $ _ . I n t e r n a l I P A d d r e s s ) < / i n t e r n a l I p A d d r e s s >  
 	 	 	 < i n t e r n a l P o r t > $ ( $ _ . I n t e r n a l P o r t ) < / i n t e r n a l P o r t >  
 	 	 	 < e x t e r n a l I p A d d r e s s > $ ( $ _ . E x t e r n a l I P A d d r e s s ) < / e x t e r n a l I p A d d r e s s >  
 	 	 	 < e x t e r n a l P o r t > $ ( $ _ . E x t e r n a l p o r t ) < / e x t e r n a l P o r t >  
 	 	 	 < e n a b l e L o g > $ ( $ _ . E n a b l e L o g ) < / e n a b l e L o g >  
 	 	 < / r u l e >  
  
 " @  
 }  
 $ B o d y   + =   @ "  
 	 < / n a t C o n f i g >  
 < / v s h i e l d E d g e C o n f i g >  
 " @  
 	 I n v o k e - R e s t A P I   - P o s t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / n e t w o r k s / $ N e t w o r k M R / e d g e "   - D a t a   $ B o d y  
 }  
  
 F u n c t i o n   G e t - v S I P S e t     {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   I P   S e t s   o n   a   p a r t i c u l a r   s c o p e .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   I P   S e t s   o n   a   p a r t i c u l a r   s c o p e .  
  
 	 	 . P A R A M E T E R     m o r e f  
 	 	 	 T h e   m o r e f   o f   t h e   s c o p e   t o   l i s t .   C a n   b e   g l o b a l   r o o t ,   a   d a t a c e n t e r   o r   a   p o r t g r o u p   o f   t h e   v C e n t e r   t o   w h i c h   v S h i e l d   M a n a g e r   i s   c o n n e c t e d .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S I P S e t  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S I P S e t   - m o r e f   d a t a c e n t e r - 1  
 	 # >  
 	 [ C m d l e t B i n d i n g ( ) ]  
 	 P a r a m   (  
 	 	 [ P a r a m e t e r ( V a l u e F r o m P i p e l i n e = $ t r u e ) ]  
 	 	 [ s t r i n g ] $ m o r e f   =   " g l o b a l r o o t - 0 "  
 	 )  
 	 P R O C E S S   {  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / i p s e t / s c o p e / $ ( $ m o r e f ) "  
 	 	 $ R u l e s   =   @ ( )  
                 i f   ( $ X M L . l i s t . i p s e t )   {  
 	 	         $ X M L . l i s t . i p s e t   |   F o r e a c h   {  
 	 	 	         $ N e w R u l e   =   " "   |   S e l e c t   i d ,   t y p e ,   n a m e ,   d e s c r i p t i o n ,   r e v i s i o n ,   s c o p e I d ,   s c o p e T y p e ,   s c o p e N a m e ,   i n h e r i t a n c e A l l o w e d ,   v a l u e  
 	 	 	         $ N e w R u l e . i d   =   $ _ . o b j e c t I d  
 	 	 	         $ N e w R u l e . t y p e   =   $ _ . t y p e . t y p e N a m e  
 	 	 	         $ N e w R u l e . n a m e   =   $ _ . n a m e  
 	 	 	         $ N e w R u l e . d e s c r i p t i o n   =   $ _ . d e s c r i p t i o n  
 	 	 	         $ N e w R u l e . r e v i s i o n   =   $ _ . r e v i s i o n  
 	 	 	         $ N e w R u l e . s c o p e I d   =   $ _ . s c o p e . i d  
                                 $ N e w R u l e . s c o p e T y p e   =   $ _ . s c o p e . o b j e c t T y p e N a m e  
                                 $ N e w R u l e . s c o p e N a m e   =   $ _ . s c o p e . n a m e  
 	 	 	         $ N e w R u l e . i n h e r i t a n c e A l l o w e d   =   $ _ . i n h e r i t a n c e A l l o w e d  
 	 	 	         $ N e w R u l e . v a l u e   =   $ _ . v a l u e  
 	 	 	         $ R u l e s   + =   $ N e w R u l e  
 	 	         }  
 	 	         $ R u l e s  
                 }  
 	 }  
 }  
  
 F u n c t i o n   N e w - v S I P S e t   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 C r e a t e s   a   n e w   I P   S e t   o n   a   p a r t i c u l a r   s c o p e .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 C r e a t e s   a   n e w   I P   S e t   o n   a   p a r t i c u l a r   s c o p e .  
  
 	 	 . P A R A M E T E R     m o r e f  
 	 	 	 T h e   m o r e f   o f   t h e   s c o p e   t o   a d d   t o .   C a n   b e   g l o b a l   r o o t ,   a   d a t a c e n t e r   o r   a   p o r t g r o u p   o f   t h e   v C e n t e r   t o   w h i c h   v S h i e l d   M a n a g e r   i s   c o n n e c t e d .  
 	 	 . P A R A M E T E R     n a m e  
 	 	 	 T h e   n a m e   o f   t h e   i p s e t   t o   b e   c r e a t e d  
 	 	 . P A R A M E T E R     d e s c r i p t i o n  
 	 	 	 A n   o p t i o n a l   d e s c r i p t i o n   f o r   t h e   i p s e t  
 	 	 . P A R A M E T E R     r e v i s i o n  
 	 	 	 T h e   r e v i s i o n   n u m b e r  
 	 	 . P A R A M E T E R     i n h e r i t  
 	 	 	 W h e t h e r   i n h e r i t a n c e   i s   e n a b l e d   ( " t r u e "   o r   " f a l s e " )  
 	 	 . P A R A M E T E R     v a l u e  
 	 	 	 T h e   v a l u e   o f   t h e   i p s e t   t o   b e   c r e a t e d  
  
 	 	 . E X A M P L E  
 	 	 	 N e w - v S I P S e t  
  
 	 	 . E X A M P L E  
 	 	 	 N e w - v S I P S e t   - m o r e f   d a t a c e n t e r - 1   - n a m e   " M y S e r v e r s "   - d e s c r i p t i o n   " S e r v e r   g r o u p "   - i n h e r i t   " t r u e "   - v a l u e   " 1 9 2 . 1 6 8 . 1 . 1 , 1 9 2 . 1 6 8 . 1 . 2 , 1 9 2 . 1 6 8 . 1 . 3 "  
  
 	 	 . E X A M P L E  
 	 	 	 N e w - v S I P S e t   - m o r e f   d a t a c e n t e r - 1   - n a m e   " M y S e r v e r s "   - d e s c r i p t i o n   " S e r v e r   g r o u p "   - i n h e r i t   " t r u e "   - v a l u e   " 1 9 2 . 1 6 8 . 1 . 0 / 2 4 "  
  
 	 	 . E X A M P L E  
 	 	 	 N e w - v S I P S e t   - m o r e f   d a t a c e n t e r - 1   - n a m e   " M y S e r v e r s "   - d e s c r i p t i o n   " S e r v e r   g r o u p "   - i n h e r i t   " t r u e "   - v a l u e   " 1 9 2 . 1 6 8 . 1 . 1 - 1 9 2 . 1 6 8 . 1 . 5 "  
 	 # >  
 	 [ C m d l e t B i n d i n g ( ) ]  
 	 P a r a m   (  
 	 	 [ P a r a m e t e r ( V a l u e F r o m P i p e l i n e = $ t r u e ) ]  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
 	 	 [ s t r i n g ] $ m o r e f   =   " g l o b a l r o o t - 0 " ,  
                 [ p a r a m e t e r ( M a n d a t o r y = $ t r u e ) ]  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
                 [ s t r i n g ] $ n a m e ,  
                 [ s t r i n g ] $ d e s c r i p t i o n   =   " " ,  
                 [ s t r i n g ] $ r e v i s i o n   =   " 1 " ,  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
                 [ V a l i d a t e S e t ( " t r u e " , " f a l s e " ) ]  
                 [ s t r i n g ] $ i n h e r i t   =   " t r u e " ,  
                 [ p a r a m e t e r ( M a n d a t o r y = $ t r u e ) ]  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
                 [ s t r i n g ] $ v a l u e  
 	 )  
         p r o c e s s   {  
  
 $ B o d y   =   @ "  
 < i p s e t >  
         < o b j e c t I d   / >    
         < t y p e >  
 	         < t y p e N a m e   / >    
         < / t y p e >  
         < d e s c r i p t i o n > $ ( $ d e s c r i p t i o n ) < / d e s c r i p t i o n >  
         < n a m e > $ ( $ n a m e ) < / n a m e >    
         < r e v i s i o n > $ ( $ r e v i s i o n ) < / r e v i s i o n >    
         < o b j e c t T y p e N a m e   / >    
         < i n h e r i t a n c e A l l o w e d > $ ( $ i n h e r i t ) < / i n h e r i t a n c e A l l o w e d >  
         < v a l u e > $ ( $ v a l u e ) < / v a l u e >    
 < / i p s e t >  
 " @  
  
 	         I n v o k e - R e s t A P I   - P o s t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / i p s e t / $ ( $ m o r e f ) "   - D a t a   $ B o d y  
         }  
 }  
  
 F u n c t i o n   R e m o v e - v S I P S e t     {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 D e l e t e s   a n   I P   S e t .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 D e l e t e s   a n   I P   S e t .  
  
 	 	 . P A R A M E T E R     i d  
 	 	 	 T h e   i d   o f   t h e   i p s e t   t o   d e l e t e .  
 	 	 . P A R A M E T E R     f o r c e  
 	 	 	 I f   s e t   t o   " t r u e "   w i l l   f o r c e   d e l e t i o n   e v e n   i f   t h e   i p   s e t   i s   i n   u s e .  
  
 	 	 . E X A M P L E  
 	 	 	 R e m o v e - v S I P S e t   - i d   i p s e t - 1  
 	 # >  
 	 [ C m d l e t B i n d i n g ( ) ]  
 	 P a r a m   (  
 	 	 [ P a r a m e t e r ( V a l u e F r o m P i p e l i n e = $ t r u e ,   M a n d a t o r y = $ t r u e ) ]  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
 	 	 [ s t r i n g ] $ i d ,  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
                 [ V a l i d a t e S e t ( " t r u e " , " f a l s e " ) ]  
                 [ s t r i n g ] $ f o r c e   =   " f a l s e "  
 	 )  
 	 P R O C E S S   {  
 	 	 I n v o k e - R e s t A P I   - d e l e t e   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / i p s e t / $ ( $ i d ) ? f o r c e = $ ( $ f o r c e ) "  
 	 }  
 }  
  
 F u n c t i o n   G e t - v S M A C S e t     {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 L i s t s   t h e   M A C   S e t s   o n   a   p a r t i c u l a r   s c o p e .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 L i s t s   t h e   M A C   S e t s   o n   a   p a r t i c u l a r   s c o p e .  
  
 	 	 . P A R A M E T E R     m o r e f  
 	 	 	 T h e   m o r e f   o f   t h e   s c o p e   t o   l i s t .   C a n   b e   g l o b a l   r o o t ,   a   d a t a c e n t e r   o r   a   p o r t g r o u p   o f   t h e   v C e n t e r   t o   w h i c h   v S h i e l d   M a n a g e r   i s   c o n n e c t e d .  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S M A C S e t  
  
 	 	 . E X A M P L E  
 	 	 	 G e t - v S M A C S e t   - m o r e f   d a t a c e n t e r - 1  
 	 # >  
 	 [ C m d l e t B i n d i n g ( ) ]  
 	 P a r a m   (  
 	 	 [ P a r a m e t e r ( V a l u e F r o m P i p e l i n e = $ t r u e ) ]  
 	 	 [ s t r i n g ] $ m o r e f   =   " g l o b a l r o o t - 0 "  
 	 )  
 	 P R O C E S S   {  
 	 	 $ X M L   =   I n v o k e - R e s t A P I   - G e t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / m a c s e t / s c o p e / $ ( $ m o r e f ) "  
 	 	 $ R u l e s   =   @ ( )  
                 i f   ( $ X M L . l i s t . m a c s e t )   {  
 	 	         $ X M L . l i s t . m a c s e t   |   F o r e a c h   {  
 	 	 	         $ N e w R u l e   =   " "   |   S e l e c t   i d ,   t y p e ,   n a m e ,   d e s c r i p t i o n ,   r e v i s i o n ,   s c o p e I d ,   s c o p e T y p e ,   s c o p e N a m e ,   i n h e r i t a n c e A l l o w e d ,   v a l u e  
 	 	 	         $ N e w R u l e . i d   =   $ _ . o b j e c t I d  
 	 	 	         $ N e w R u l e . t y p e   =   $ _ . t y p e . t y p e N a m e  
 	 	 	         $ N e w R u l e . n a m e   =   $ _ . n a m e  
 	 	 	         $ N e w R u l e . d e s c r i p t i o n   =   $ _ . d e s c r i p t i o n  
 	 	 	         $ N e w R u l e . r e v i s i o n   =   $ _ . r e v i s i o n  
 	 	 	         $ N e w R u l e . s c o p e I d   =   $ _ . s c o p e . i d  
                                 $ N e w R u l e . s c o p e T y p e   =   $ _ . s c o p e . o b j e c t T y p e N a m e  
                                 $ N e w R u l e . s c o p e N a m e   =   $ _ . s c o p e . n a m e  
 	 	 	         $ N e w R u l e . i n h e r i t a n c e A l l o w e d   =   $ _ . i n h e r i t a n c e A l l o w e d  
 	 	 	         $ N e w R u l e . v a l u e   =   $ _ . v a l u e  
 	 	 	         $ R u l e s   + =   $ N e w R u l e  
 	 	         }  
 	 	         $ R u l e s  
                 }  
 	 }  
 }  
  
 F u n c t i o n   N e w - v S M A C S e t   {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 C r e a t e s   a   n e w   M A C   S e t   o n   a   p a r t i c u l a r   s c o p e .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 C r e a t e s   a   n e w   M A C   S e t   o n   a   p a r t i c u l a r   s c o p e .  
  
 	 	 . P A R A M E T E R     m o r e f  
 	 	 	 T h e   m o r e f   o f   t h e   s c o p e   t o   a d d   t o .   C a n   b e   g l o b a l   r o o t ,   a   d a t a c e n t e r   o r   a   p o r t g r o u p   o f   t h e   v C e n t e r   t o   w h i c h   v S h i e l d   M a n a g e r   i s   c o n n e c t e d .  
 	 	 . P A R A M E T E R     n a m e  
 	 	 	 T h e   n a m e   o f   t h e   m a c s e t   t o   b e   c r e a t e d  
 	 	 . P A R A M E T E R     d e s c r i p t i o n  
 	 	 	 A n   o p t i o n a l   d e s c r i p t i o n   f o r   t h e   m a c s e t  
 	 	 . P A R A M E T E R     r e v i s i o n  
 	 	 	 T h e   r e v i s i o n   n u m b e r  
 	 	 . P A R A M E T E R     i n h e r i t  
 	 	 	 W h e t h e r   i n h e r i t a n c e   i s   e n a b l e d   ( " t r u e "   o r   " f a l s e " )  
 	 	 . P A R A M E T E R     v a l u e  
 	 	 	 T h e   v a l u e   o f   t h e   m a c s e t   t o   b e   c r e a t e d  
  
 	 	 . E X A M P L E  
 	 	 	 N e w - v S M A C S e t  
  
 	 	 . E X A M P L E  
 	 	 	 N e w - v S M A C S e t   - m o r e f   d a t a c e n t e r - 1   - n a m e   " M y S e r v e r s "   - d e s c r i p t i o n   " S e r v e r   g r o u p "   - i n h e r i t   " t r u e "   - v a l u e   " 2 2 : 3 3 : 4 4 : 5 5 : 6 6 : 7 7 , 0 0 : 1 1 : 2 2 : 3 3 : 4 4 : 5 5 "  
 	 # >  
 	 [ C m d l e t B i n d i n g ( ) ]  
 	 P a r a m   (  
 	 	 [ P a r a m e t e r ( V a l u e F r o m P i p e l i n e = $ t r u e ) ]  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
 	 	 [ s t r i n g ] $ m o r e f   =   " g l o b a l r o o t - 0 " ,  
                 [ p a r a m e t e r ( M a n d a t o r y = $ t r u e ) ]  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
                 [ s t r i n g ] $ n a m e ,  
                 [ s t r i n g ] $ d e s c r i p t i o n   =   " " ,  
                 [ s t r i n g ] $ r e v i s i o n   =   " 1 " ,  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
                 [ V a l i d a t e S e t ( " t r u e " , " f a l s e " ) ]  
                 [ s t r i n g ] $ i n h e r i t   =   " t r u e " ,  
                 [ p a r a m e t e r ( M a n d a t o r y = $ t r u e ) ]  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
                 [ s t r i n g ] $ v a l u e  
 	 )  
         p r o c e s s   {  
  
 $ B o d y   =   @ "  
 < m a c s e t >  
         < o b j e c t I d   / >    
         < t y p e >  
 	         < t y p e N a m e   / >    
         < / t y p e >  
         < d e s c r i p t i o n > $ ( $ d e s c r i p t i o n ) < / d e s c r i p t i o n >  
         < n a m e > $ ( $ n a m e ) < / n a m e >    
         < r e v i s i o n > $ ( $ r e v i s i o n ) < / r e v i s i o n >    
         < o b j e c t T y p e N a m e   / >    
         < i n h e r i t a n c e A l l o w e d > $ ( $ i n h e r i t ) < / i n h e r i t a n c e A l l o w e d >  
         < v a l u e > $ ( $ v a l u e ) < / v a l u e >    
 < / m a c s e t >  
 " @  
  
 	         I n v o k e - R e s t A P I   - P o s t   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / m a c s e t / $ ( $ m o r e f ) "   - D a t a   $ B o d y  
         }  
 }  
  
 F u n c t i o n   R e m o v e - v S M A C S e t     {  
 	 < #  
 	 	 . S Y N O P S I S  
 	 	 	 D e l e t e s   a n   M A C   S e t .  
  
 	 	 . D E S C R I P T I O N  
 	 	 	 D e l e t e s   a n   M A C   S e t .  
  
 	 	 . P A R A M E T E R     i d  
 	 	 	 T h e   i d   o f   t h e   m a c s e t   t o   d e l e t e .  
 	 	 . P A R A M E T E R     f o r c e  
 	 	 	 I f   s e t   t o   " t r u e "   w i l l   f o r c e   d e l e t i o n   e v e n   i f   t h e   m a c   s e t   i s   i n   u s e .  
  
 	 	 . E X A M P L E  
 	 	 	 R e m o v e - v S M A C S e t   - i d   m a c s e t - 1  
 	 # >  
 	 [ C m d l e t B i n d i n g ( ) ]  
 	 P a r a m   (  
 	 	 [ P a r a m e t e r ( V a l u e F r o m P i p e l i n e = $ t r u e ,   M a n d a t o r y = $ t r u e ) ]  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
 	 	 [ s t r i n g ] $ i d ,  
                 [ V a l i d a t e N o t N u l l O r E m p t y ( ) ]  
                 [ V a l i d a t e S e t ( " t r u e " , " f a l s e " ) ]  
                 [ s t r i n g ] $ f o r c e   =   " f a l s e "  
 	 )  
 	 P R O C E S S   {  
 	 	 I n v o k e - R e s t A P I   - d e l e t e   - U R I   " $ ( $ D e f a u l t v S h i e l d S e r v e r . S e r v e r U R I ) a p i / 2 . 0 / s e r v i c e s / m a c s e t / $ ( $ i d ) ? f o r c e = $ ( $ f o r c e ) "  
 	 }  
 }  
 