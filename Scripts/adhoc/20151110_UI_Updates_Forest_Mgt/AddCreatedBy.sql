alter table firebreak_line add created_by_id integer;
update firebreak_line set created_by_id = (select id from auth_user where username='ernst');
ALTER TABLE public.firebreak_line
  ADD CONSTRAINT fk_firebreak_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user (id)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_firebreak_auth_user
  ON public.firebreak_line(created_by_id);